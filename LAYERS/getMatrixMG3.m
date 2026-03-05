function [A,alfa,beta]=getMatrixMG3(k,incAngleDeg,mu,zj,numMedia,d,nVec,n,...
        isWire,A,GAMMAMGReflect,GAMMAMGTransmit,nSizeSubmatrix)
    global isdoChange
%There are numMedia layers, with k and mu representing the values within each medium
%where the uppermost (incident) medium is number 1.  The z-value of the
%bottom of each media is given by zj, so there is one less the number of
%elements in zj than in k.
%getMatrix sets up a sub-matrix for solving the problem of a periodic metasurface
%below a system of dielectric layers characterized by mu.  mu is mu for TE
%and epsilon for TM.
%For the standard version of this program,there was only a downward wave in
%the lowest region.
%However, in this MMARC version, there is a periodic surface (BPS) below the
%MMARC layers. Between the MMARC and the BPS, there is an auxiliary air
%region. This air region is just like any other layer, so that there are
%both upward and downward wave components. Since this auxiliary region has
%the same properties as the lowest region, it can be programmed like the
%other regions (i.e. with two wave components, upward and downward).
% 
isWire(isWire~=1)=0; %make isWire compatible with its original definition.
p=nVec(n);
sinIncAngle=sind(incAngleDeg);
%cosIncAngle=cosd(incAngleDeg);
alfa=k(1)*sinIncAngle+2*p*pi/d;
k2=k.*k;
beta=k.*sqrt(1-alfa*alfa./k2);
%For the radiation condition to be satisfied in the downard direction, 
%imag(beta) must be positive.
%For this application there is no radiation in the downward direction.
%There is, though, in the upward direction.
%If its not positive, change the sign of the entire variable.
ind=find(imag(beta)<0);
beta(ind)=-beta(ind);
%It could be we need to also define beta0.
%nIntersections=numMedia-1;  
nIntersections=numMedia;   %Since numMedia was re-re-defined on call to mainBotFloqMG.
%The following criterion is probably WRONG. Correct later.
if any(isWire)
    nIntersections=numMedia-1;
end    
%It is assumed there is more than one intersection.
%Build the matrix
%A=zeros(2*numMedia-2,2*numMedia-2);
hj=[-diff(zj);0];
%A=zeros(2*numMedia-2,2*numMedia-1);
%First intersection
%The upper face of the interface.
icolStart=(n-1)*nSizeSubmatrix+1;
icol=icolStart;
irow=1;
im=1;
eibh=exp(1i*beta(im+1)*hj(im));
if isWire(1)
    %For this top interface, there is no A,which usually occupies the first
    %column. So for this top interface, subtract 1 from the column number.
    %But this has to be done cumulatively for all the modes. This
    %(hopefully) is accomplished by -1*ii term in jcol=.
    %A(irow,icol+1)=-1;       %B at top of interface im (in material im-1)
    %A(irow+1,icol+2)=-1*exp(-1i*beta(im+1)*hj(im));  %A at bottom of interface im (in material im)
    A(irow,icol)=-1;       %B at top of interface im (in material im-1)
    A(irow+1,icol)=beta(im);  %B at top of interface im (in material im-1)
    if numMedia>2
        A(irow,icol+1)=1/eibh;  %A at bottom of interface im (in material im)
        A(irow,icol+2)=eibh;   %B at bottom of interface im (in material im)
        %The second equation
        A(irow+1,icol+1)=beta(im+1)/eibh;  %A at bottom of interface im (in material im)
        A(irow+1,icol+2)=-eibh*beta(2)/mu(2);   %B at bottom of upper interface
        %minus sign inserted in exponent as correction.
        icolGroup=icol-icolStart+1;
        kxq=k(1)*sinIncAngle+(2*pi/d)*nVec;
        km=k(im+1);
        kyq=sqrt((km-kxq).*(km+kxq));
        indexImagkyqNeg=find(imag(kyq)<0);
        kyq(indexImagkyqNeg)=-kyq(indexImagkyqNeg);
        for ii=1:length(nVec)
            ebeta=exp(1i*kyq(ii)*hj(im));
            jcol=(ii-1)*nSizeSubmatrix+icolGroup;
            %A(irow+1,jcol+2)=-GAMMAMGTransmit(ii,n,im); %B at bottom of interface im (in material im)
            %A(irow+1,jcol+2)=-GAMMAMGTransmit(ii,n,im); %B at bottom of interface im (in material im)
            A(irow+1,jcol+2)=A(irow+1,jcol+2)-GAMMAMGReflect(ii,n,im)*ebeta; %B at bottom of interface im (in material im)
        end
    else
        %If isWire(1) and numMedia==2, then we only have an array of wires
        %and nothing else. So all the rest of the stuff can't happen
        %because in the incidence medium we can't have an A wave and in the
        %transmission medium we can't have a B wave.
        A(irow,icol+1)=1/eibh;  %A at bottom of interface im (in material im)
        %A(irow,icol+2)=exp(1i*beta(im+1)*hj(im));   %B at bottom of interface im (in material im)
        %The second equation
        A(irow+1,icol+1)=beta(im+1)/eibh;  %A at bottom of interface im (in material im)
        %minus sign inserted in exponent as correction.
        return
    end
else    
    %Satisfy continuity of E(H)-field parallel to interface, z=0.
    A(irow,icol)=-1;                           %B at top of upper interface
    %The lower face of the interface
    A(irow,icol+1)=1/eibh;     %A at bottom of upper interface
    A(irow,icol+2)=eibh;      %B at bottom of upper interface
    %Satisfy continuity of H(E)-field parallel to interface, z=0.
    %The upper face of the interface.
    A(irow+1,icol)=beta(1)/mu(1);                  %B at top of upper interface
    %The lower face of the interface
    A(irow+1,icol+1)=(1/eibh)*beta(2)/mu(2);  %A at bottom of upper interface
    A(irow+1,icol+2)=-eibh*beta(2)/mu(2);   %B at bottom of upper interface
end    
%
%Loop on intermediate intersections
irow=irow+2;
icol=icol+1;
for im=2:nIntersections-1
    eibh=exp(1i*beta(im+1)*hj(im));
    %
    if isWire(im)
        A(irow,icol)=-1;           %A at top of interface im (in material im-1)
        A(irow,icol+1)=-1;       %B at top of interface im (in material im-1)
        %The lower face of the interface
        A(irow,icol+2)=1/eibh;  %A at bottom of interface im (in material im)
        A(irow,icol+3)=eibh;   %B at bottom of interface im (in material im)
        %The second equation
        %
%         A(irow+1,icol+1)=beta(im);  %B at top of interface im (in material im-1)
%         A(irow+1,icol+2)=beta(im+1)/eibh;  %A at bottom of interface im (in material im)
        %CHANGED BY SWM 28.7.23
        %The upper face of the interface
        A(irow+1,icol)=-beta(im)/mu(im);       %A at top of interface im (in material im-1)
        A(irow+1,icol+1)=beta(im)/mu(im);      %B at top of interface im (in material im-1)
        %The lower face of the interface
        A(irow+1,icol+2)=(beta(im+1)/mu(im+1))/eibh; %A at bottom of interface im (in material im)
        A(irow+1,icol+3)=-(beta(im+1)/mu(im+1))*eibh; %B at bottom of interface im (in material im)
        %end change
        %
        icolGroup=icol-icolStart+1;
        kxq=k(1)*sinIncAngle+(2*pi/d)*nVec;
        km=k(im+1);
        kyq=sqrt((km-kxq).*(km+kxq));
        indexImagkyqNeg=find(imag(kyq)<0);
        kyq(indexImagkyqNeg)=-kyq(indexImagkyqNeg);
        for ii=1:length(nVec)
            ebeta=exp(1i*kyq(ii)*hj(im));
            jcol=(ii-1)*nSizeSubmatrix+icolGroup;
            A(irow+1,jcol)=A(irow+1,jcol)-GAMMAMGReflect(ii,n,im);   %A at top of interface im (in material im-1)
            %A(irow+1,jcol+3)=-GAMMAMGTransmit(ii,n,im); %B at bottom of interface im (in material im)
            A(irow+1,jcol+3)=A(irow+1,jcol+3)-GAMMAMGReflect(ii,n,im)*ebeta; %B at bottom of interface im (in material im)
        end
    else
        %Satisfy continuity of E(H)-field parallel to interface
        %Note that in layer (not including incidence region), the layer
        %index of beta and mu is 1 greater than the layer index. This is because
        %the index for these variables starts in the incidence region. The
        %reference level of a layer is at its bottom. The interface number
        %has the same index as the layer below that interface.
        %The upper face of the interface
        A(irow,icol)=-1;           %A at top of interface im (in material im-1)
        A(irow,icol+1)=-1;         %B at top of interface im (in material im-1)
        %The lower face of the interface
        A(irow,icol+2)=1/eibh;  %A at bottom of interface im (in material im)
        A(irow,icol+3)=eibh;   %B at bottom of interface im (in material im)
        %
        %Satisfy continuity of H(E)-field parallel to interface, z=0.
        %The upper face of the interface
        A(irow+1,icol)=-beta(im)/mu(im);       %A at top of interface im (in material im-1)
        A(irow+1,icol+1)=beta(im)/mu(im);      %B at top of interface im (in material im-1)
        %The lower face of the interface
        A(irow+1,icol+2)=(beta(im+1)/mu(im+1))/eibh; %A at bottom of interface im (in material im)
        A(irow+1,icol+3)=-(beta(im+1)/mu(im+1))*eibh; %B at bottom of interface im (in material im)
    end
    irow=irow+2;
    icol=icol+2;
end
%Now the last intersection
im=nIntersections;
eibh=exp(1i*beta(im+1)*hj(im));
doWire=false;
if any(isWire)
    if isWire(im)
        doWire=true;
    end
end    
if doWire
    %For this lowest intersection, there is no B term in the lowest region (transmission region).
    A(irow,icol)=-1;             %A at top of bottom interface
    A(irow,icol+1)=-1;           %B at top of bottom interface
    %The lower face of the interface
    A(irow,icol+2)=1/eibh;  %A at bottom of interface im (in material im)
    %A(irow,icol+3)=exp(1i*beta(im+1)*hj(im));   %B at bottom of interface im (in material im)
    %In lowest region, the reference location is at the bottom interface,
    %so that hj(im)=0.
    %The second equation
    A(irow+1,icol)=-beta(im)/mu(im);         %A at top of bottom interface
    A(irow+1,icol+1)=beta(im);  %B at top of interface im (in material im-1)
    A(irow+1,icol+2)=beta(im+1)/eibh;  %A at bottom of interface im (in material im)
    %minus sign inserted in exponent as correction.
    icolGroup=icol-icolStart+1;
    for ii=1:length(nVec)
        jcol=(ii-1)*nSizeSubmatrix+icolGroup;
        A(irow+1,jcol)=A(irow+1,jcol)-GAMMAMGReflect(ii,n,im);   %A at top of interface im (in material im-1)
        %A(irow+1,jcol+3)=-GAMMAMGTransmit(ii,n,im); %B at bottom of interface im (in material im)
    end
    %irow=irow+2;
    %icol=icol+2;
else
    %Satisfy continuity of E(H)-field parallel to interface
    %The upper face of the interface
    A(irow,icol)=-1;             %A at top of bottom interface
    A(irow,icol+1)=-1;           %B at top of bottom interface
    %The lower face of the interface
    A(irow,icol+2)=1/eibh;   %A at bottom of bottom interface
    %A(irow,icol+3)=exp(1i*beta(im+1)*hj(im));
    %
    %Satisfy continuity of H(E)-field parallel to interface, z=0.
    %The upper face of the interface
    A(irow+1,icol)=-beta(im)/mu(im);         %A at top of bottom interface
    A(irow+1,icol+1)=beta(im)/mu(im);        %B at top of bottom interface
    %The lower face of the interface
    A(irow+1,icol+2)=(beta(im+1)/mu(im+1))/eibh;  %A at bottom of bottom interface
end