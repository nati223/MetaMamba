function [rhoFloq,sigmaAFloq,sigmaBFloq,tauFloq,alfa,beta,residual,alfaFloq,betaFloq,ABsumForCurrent]=...
    mainBotFloquetMG3(k,mu,zj,numMedia,incAngleDeg,GAMMAMGReflect,GAMMAMGTransmit,...
    d,nVec,incAngDegFloq,isWire,isIncWavePropSpectrum,EincComplex,nPropagating)
%global isdoChange
    %mainBotFloquetA(k,mu,zj,numMedia,incAngleDeg,GAMMA00,GAMMA01,GAMMA11,GAMMA10,d,nVec)
%There are numMedia layers, with k and mu representing the values within each medium
%where the uppermost (incident) medium is number 1.  The z-value of the
%top of each medium is given by zj, so there is one less the number of
%elements in zj than in k.
%mainBot sets up and solves the linear system of equations.
%
%**************
isWire(isWire~=1)=0; %make isWire compatible with its original definition.
sinIncAngle=sind(incAngleDeg);
%cosIncAngle=cosd(incAngleDeg);
alfa=k(1)*sinIncAngle;
k2=k.*k;
beta=k.*sqrt(1-alfa*alfa./k2);
%For the radiation condition to be satisfied in the downard direction, 
%imag(beta) must be positive.
%If its not positive, change the sign of the entire variable.
ind=find(imag(beta)<0);
beta(ind)=-beta(ind);
%*********************************
%
%The following is for returning the parameter betaFloq.
lengthnVec=length(nVec);
betaFloq=zeros(numMedia+1,lengthnVec);
%sinIncAngle=sind(incAngleDeg);
%k2=k.*k;
for n=1:lengthnVec
    p=nVec(n);
    alfaa=k(1)*sinIncAngle+2*p*pi/d;
    betaa=k.*sqrt(1-alfaa*alfaa./k2);
    ind=find(imag(betaa)<0);
    betaa(ind)=-betaa(ind);
    betaFloq(:,n)=betaa;
end
%********************
%
%indicesWires=find(isWire);
indicesNotWires=find(~isWire);
% %Exclude the first and last if they are not wires.
% if indicesNotWires(1)==1
%     indicesNotWires=indicesNotWires(2:end);
% end
% if indicesNotWires(end)==length(isWire)
%     indicesNotWires=indicesNotWires(1:end-1);
% end

%Translate the parameters to new system in which the only interfaces are
%the wires, the top of the dielectric and the bottom of the dielectric.
%We want to redefine
%k,mu,zj,numMedia,GAMMAMGReflect,GAMMAMGTransmit,isWire.
%kV and muV have dimensions numMedia+1.
%zj has dimension numMedia.
%GAMMAMGReflect, GAMMAMGTransmit and isWire have dimension numMedia-1;
kV=k;
muV=mu;
zjV=zj;
GAMMAMGReflectV=GAMMAMGReflect;
GAMMAMGTransmitV=GAMMAMGTransmit;
isWireV=isWire;
numMediaV=numMedia;
%We wish to eliminate the following interfaces: 
%1. Interfaces between dielectric media of the same type, but not when they
%are separated by a wire array. Forget about this.
%2. Interfaces between wires at the same level (i.e. adjacent indeces).
%We wish to transform to a system based on the interfaces.
%An interface of wires is considered a single interface.
%numMediaV will be the number of interfaces+1, so that the number of
%interfaces will be numMediaV-1.
%isWireV(1:numMediaV-1) will indicate the type of interface, wire(=1) or material (=0).
%kV(i) and muV(i) will characterize the medium BEFORE the interface i, so the number will be the
%number of interfaces+1 or numMediaV. 
%zjV wil now be the y-location of each interface, so it will have
%numMediaV-1 elements. Note that since a wire has been considered like a
%layer up to now, it has two interfaces in zj, and has a material wave
%number associated with it.

%Don't change things if there is no wire.
%if false
if any(isWire)
%For the first interface, determine if it is dielectric or wire.
    if numMedia>2
        %numMedia cannot equal 1 (or shouldn't). If numMedia=2, this can
        %only happen if there is only a single wire array or a single layer.
        %But then, no change is necessary. Therefore, only do this procedure if
        %numMedia>2.
        newindecesZj=[indicesNotWires indicesNotWires(end)+1];
        zjV=zj(newindecesZj);
        newindecesK=[1 newindecesZj+1];
        kV=k(newindecesK);
        muV=mu(newindecesK);
        %We are interested in intersections. In isWire, if there is a
        %sequence 1 0 1, then there is a material layer sandwiched between
        %two wire arrays. That is, there are two interfaces, both wire
        %arrays. The material layer does not contribute to the interface.
        %So remove it from isWire.
        seq=[1 0 1];
        indseq=strfind(isWire,seq);
        if ~isempty(indseq)
            %This is the index of the start of seq 1 0 1. We want the 0.
            indseq=indseq+1;
            %Remove these members from isWire;
            isWireV(indseq)=[];
            GAMMAMGReflectV(:,:,indseq)=[];
            GAMMAMGTransmitV(:,:,indseq)=[];
        end
        %If between ones in isWireV there are more than one zeros that are adjacent to each other, then
        %remove one of the zeros in that group.
        seq=[1 0 0];
        indseq=strfind(isWireV,seq);
        if ~isempty(indseq)
            %This is the index of the start of seq 1 0 0. We want the 0.
            indseq=indseq+1;
            %Remove these members from isWireV, but only if there is a 1
            %following.  If there are more than one indeces in indseq, then
            %there would certainly be a 1 following. The last one may not
            %have a one following. Check if last one has a 1 following.
            indexLast=indseq(end);
            if ~any(isWireV(indexLast+1:end))
                indseq(end)=[];
            end
            isWireV(indseq)=[];
            GAMMAMGReflectV(:,:,indseq)=[];
            GAMMAMGTransmitV(:,:,indseq)=[];
        end
        
        numMediaV=length(isWireV)+1;
    end
end
%end
%Build the matrices
%Allocate the large main matrix AAA
%When numbering the media in Matlab (not in the paper), the incident region
%is not considered. The top layer is 1. The last medium (numMedia) is the
%semi-infinite transmission region. The wire array is counted as is its own
%layer. But in the matrix equation here, the wire array is counted as two
%layers, one an auxiliary layer above the wires, and the other an auxiliary
%region below the wires. So when allocating space for the matrices, we have
%to add one additional layer for each wire array. 
%But if there are two arrays along each interface, and we account for both
%of them being there, then we do not have to add any.
%Get the number of wire arrays.
%indIsWire=find(isWire);
%nWireArrays=length(indIsWire);
%Note that if nWireArrays=0, the configuration is not periodic, so that
%Floquet analysis is not needed.
%numMediaEff=numMedia+nWireArrays;
numMediaEff=numMediaV;
% if numMediaV==2 && isWire(1)
%     %There is only a single wire array, no material.
%     numMediaEff=1;
% end 
%The following criterion is WRONG. Correct in future.
if any(isWireV)
    numMediaEff=numMediaEff-1;
end
%
nSizeSubmatrix=2*numMediaEff;
lengthnVec=length(nVec);
matsize=lengthnVec*(nSizeSubmatrix);
AAA=zeros(matsize,matsize);
C=zeros(matsize,1);   %free vector
%Define auxiliary zero-matrix to fill in the zero parts of the large
%matrix.
%zA=zeros(2*numMedia-2,2*numMedia-1);
%
%
%Allow for non-zero angle incident wave. 
ind=find(abs(incAngDegFloq-incAngleDeg)<1.e-2);
cosincAngDegFloq=cosd(incAngDegFloq);
cosincAngDegFloq(isnan(cosincAngDegFloq))=0;
if isempty(ind)
    msgbox('Incidence angle not a Floquet direction')
    incFloqIndex=0;
else
    incFloqIndex=nVec(ind);
end    
%
%
alfaFloq=zeros(1,lengthnVec);
betaFloqV=zeros(numMediaV,lengthnVec);
isizeA=nSizeSubmatrix;
irow=1;
for n=1:lengthnVec
    %A is the submatrix representing a single Floquet mode. Initiate it for
    %the current mode.
    A=zeros(nSizeSubmatrix,matsize);
    [A,alfap,betap]=getMatrixMG3(kV,incAngleDeg,muV,zjV,numMediaV,d,nVec,n,...
        isWireV,A,GAMMAMGReflectV,GAMMAMGTransmitV,nSizeSubmatrix);
    alfaFloq(n)=alfap;
    betaFloqV(:,n)=betap(1:numMediaV);
    %Stick this into its place in the larger matrix.
    AAA(irow:irow+isizeA-1,:)=A;
    %This is the part that contains the incident wave.  So update the
    %free vector.
    if isIncWavePropSpectrum
        %Instead of having a single unit incident wave, we have a spectrum
        %of incident waves corresponding to the spectrum of propagating
        %Floquet waves. These have the values EincComplex.
        C(irow)=EincComplex(n);
        %C(irow+1)=EincComplex(n)*(GAMMAMGReflectV(n,n,1)+beta(1)/mu(1));
        %C(irow+1)=GAMMAMGReflectV(ind,n,1)+EincComplex(n)*beta(1)/mu(1);
        %The above gives the correct answer when the spectrum consists only
        %of a single wave normal to the surface (0-mode), all other components being
        %0. If the spectrum consists of a single wave, -1 mode, then we would
        %replace ind with ind-1. I think, for the entire spectrum of
        %propagating waves, it should be as follows.
        %sumEGR=sum(EincComplex(nPropagating)*GAMMAMGReflectV(nPropagating,n,1));
        % sumEGR=sum(EincComplex(nPropagating))*GAMMAMGReflectV(ind,n,1);
        % C(irow+1)=sumEGR+EincComplex(n)*beta(1)/mu(1);
        %sumEGR=sum(EincComplex(nPropagating));
        sumBM=EincComplex(n)*cosincAngDegFloq(n)*beta(1)/mu(1);
        if isWire(1)
            sumEGR=sum(EincComplex(nPropagating).*GAMMAMGReflectV(nPropagating,n,1));
            C(irow+1)=sumEGR+sumBM;
        else
            C(irow+1)=sumBM;
        end
    else
        if isWire(1)
            %There is a wire array adjacent to the incident region.
            %C(irow+1)=GAMMAMGReflectV(ind,n,1);
            C(irow)=eq(ind,n);
            C(irow+1)=GAMMAMGReflectV(ind,n,1)+eq(ind,n)*beta(1)/mu(1);
        else
            %There is a dielectric layer adjacent to the incident region.
            if nVec(n)==incFloqIndex
                C(irow)=1;
                C(irow+1)=beta(1)/mu(1);
            end
        end
    end
    irow=irow+isizeA;
end

rhoSigmaTau=AAA\C;
%rhoSigmaTau=linsolve(AAA,C);

%How accurate is the solution?
residual=norm(AAA*rhoSigmaTau-C);
%We want to arrange the propagation coefficients so that the different
%Floquet modes will be in different columns, and the different layers will
%be in different rows.
%rhoFloq=rhoSigmaTau(1:jsizeA:matsize)'; %row vector
rhoFloq=rhoSigmaTau(1:nSizeSubmatrix:matsize).'; %row vector
isDoSigma=true;
if nSizeSubmatrix<=2
    isDoSigma=false;
end 
if isDoSigma
    sigmaAFloqV=zeros((nSizeSubmatrix-2)/2,lengthnVec);
    sigmaBFloqV=zeros((nSizeSubmatrix-2)/2,lengthnVec);
end    
ABsumForCurrent=zeros(numMediaV-1,1);
nskip=0;
%for ii=1:numMediaV-1
for ii=1:numMediaEff-1
    if isWireV(ii)
        jjWire=2*ii;
        ABsumForCurrent(ii)=sum(rhoSigmaTau(jjWire:nSizeSubmatrix:matsize))...
            +sum(rhoSigmaTau(jjWire+1:nSizeSubmatrix:matsize));
        if numMediaV<=2
            continue
        end
    end
    if isDoSigma
        jj=2*(ii+nskip);
        sigmaAFloqV(ii,:)=rhoSigmaTau(jj:nSizeSubmatrix:matsize);
        sigmaBFloqV(ii,:)=rhoSigmaTau(jj+1:nSizeSubmatrix:matsize);
    end
end
tauFloq=rhoSigmaTau(nSizeSubmatrix:nSizeSubmatrix:matsize).';
%
%Transform back to expanded coordinate configuration
if ~isDoSigma
    sigmaAFloq=[];
    sigmaBFloq=[];
    %betaFloq=betaFloqV;
else
    sigmaAFloq=zeros(numMedia-1,lengthnVec);
    sigmaBFloq=zeros(numMedia-1,lengthnVec);
    %betaFloq=zeros(numMedia,lengthnVec);
    sigmaAFloq(indicesNotWires,:)=sigmaAFloqV;
    sigmaBFloq(indicesNotWires,:)=sigmaBFloqV;
    %betaFloq(end,:)=betaFloqV(end,:);
    %betaFloq(indicesNotWires,:)=betaFloqV(1:end-1,:);
end