
function [powerCouplingEffTransmission,powerCouplingEffReflec,powerCouplingEffSideways]...
    =cst2effpw3(waveLength,d,fnameFullConfig,...
    focalDistance,lensThickness)
    %This script analyzes the efficiency of scattering
    %by an LUT surface from a plane from below (i.e. in +z direction)
    % to a focus 3*lambda above the top of the surface.
    %
    zsurf=-lensThickness;  %Bottom of surface
    zval1=-waveLength;  %mm     the reference point for power of plane wave only and for reflection
    %Define the x-distance from the left end at which integrations starts.
    
    fname=fnameFullConfig;
    AStruct=importdata(fname,' ',2);
    AA=AStruct.data;
    %Find the number of x-values, y-values and z-values.
    xxx=AA(:,1);
    yyy=AA(:,2);
    zzz=AA(:,3);
    indy=find(yyy~=yyy(1));
    if ~isempty(indy)
        %There is more than 1 y-value.
        nxcst=indy(1)-1;
        xcst=xxx(1:nxcst);
        indz=find(zzz~=zzz(1));
        nynz=indz(1)-1;
        nycst=nynz/nxcst;
        ycst=yyy(1:nxcst:nynz);
        nxnynz=length(zzz);
        nzcst=nxnynz/nynz;
        zcst=zzz(1:nynz:nxnynz);
        thickness=ycst(end)-ycst(1);
    else
        nycst=1;
        indz=find(zzz~=zzz(1));
        nxcst=indz(1)-1;
        xcst=xxx(1:nxcst);
        nxnynz=length(zzz);
        zcst=zzz(1:nxcst:nxnynz);
        nzcst=length(zcst);
    end

    
    ny=max(fix(nycst/2),1);
    %
    PPP=AA(:,6);  %z-component of the Poynting vector
    PP=reshape(PPP,nxcst,nycst,nzcst);
    P=zeros(nxcst,nzcst);
    P(:,:)=PP(:,ny,:);
    P=P';
    %
    QQQ=AA(:,4);  %x-component of the Poynting vector
    QQ=reshape(QQQ,nxcst,nycst,nzcst);
    Q=zeros(nxcst,nzcst);
    Q(:,:)=QQ(:,ny,:);
    Q=Q';
    %
    %We will be expressing results as power relative to the power of the
    %incident wave. The incident wave is defined as a plane wave with
    %E-field 1 V/m. The H field is E/eta, where eta=377. Therefore, the
    %average power flow of incident wave is 1/2 * E*E/eta=1/(2*eta).
    eta=377;
    meanSource=1/(2*eta);
    %Draw the color image of the z-directed power:
    %pwr=PPP2./PPP1;
    pwr=P/meanSource;
    figure
    imagesc(xcst/waveLength,zcst/waveLength,pwr,[0 10])
    set(gca,'ydir','normal')
    axis equal
    title('P_z/P_{inc}')
    colormap("parula")
    colorbar
    %draw the lens boundaries
    xlim=get(gca,'xlim');
    line(xlim,[0 0],'color','m')
    line(xlim,[zsurf zsurf]/waveLength,'color','m')
    xlabel('x/\lambda')
    ylabel('z/\lambda')
    %
    %
    %Draw the color image of the x-directed power:
    pwrx=Q/meanSource;
    figure
    imagesc(xcst/waveLength,zcst/waveLength,pwrx,[-3 3])
    colormap("jet")
    colorbar
    set(gca,'ydir','normal')
    axis equal
    title('P_x/P_{inc}')
    %draw the lens boundaries
    xlim=get(gca,'xlim');
    line(xlim,[0 0],'color','m')
    line(xlim,[zsurf zsurf]/waveLength,'color','m')
    xlabel('x/\lambda')
    ylabel('z/\lambda')
    %
    %
    %Draw power field on lines through the focus.
    %Find the  z index closest.
    indfpzHigh=find(zcst>=focalDistance);
    indfpz=indfpzHigh(1);
    figure
    plot(xcst/waveLength,pwr(indfpz,:));
    xlabel('x/\lambda')
    ylabel('P_z/P_{inc}')
    title('Along z=f')
    grid
    %
    %Draw power field on lines through the focus.
    %Find the x index closest.
    indfpxHigh=find(xcst>=0);
    indfpx=indfpxHigh(1);
    figure
    plot(zcst/waveLength,pwr(:,indfpx));
    xlabel('z/\lambda')
    ylabel('P_z/P_{inc}')
    title('Along x=0')
    grid
    %
    %draw the lens boundaries
    ylim=get(gca,'ylim');
    line([zsurf zsurf]/waveLength,ylim,'color','m')
    line([0 0],ylim,'color','m')
    %
    %
    %
    %Transmission efficiency.
    %At location of the focal point
    %powerCouplingEffTransmission=mean(pwr(indfpz,:),'omitnan');
    %Get reflected wave at z=zval1.
    %zval1=zcst(1);
    indzz=find(zcst>=zval1);
    indzreflec=indzz(1);
    powerCouplingEffReflec=1-mean(pwr(indzreflec,:),'omitnan');
    %
    %Now the sideways efficiency.When the boundary is the end of the lens
    %itself, this gives a misleading answer (very high), evidently as 
    % a result of the
    %power field in the lens. Instead of omitting these points, let's make 
    % sure that in CST we add space so that the end boundary does not
    % include part of the lens.
    indzz=find(zcst>=-lensThickness);
    indzLensBottom=indzz(1)-1;
    indzz=find(zcst>=0);
    indzLensTop=indzz(1)+1;
    %
    % lenSideBoundary=focalDistance-zval1;
    % lenTopBotBoundary=xcst(end)-xcst(1);
    % lenratio=lenSideBoundary/lenTopBotBoundary;
    % powerCouplingEffSideways=-2*lenratio*mean(pwrx(indzreflec:indfpz,1),'omitnan');
    %
    %What happens if instead of using the focal point to measure the
    %transmission efficiency, we use the top of the lens at z=0?
    powerCouplingEffTransmission=mean(pwr(indzLensTop,:),'omitnan');
    lenSideBoundary=-zval1;
    lenTopBotBoundary=xcst(end)-xcst(1);
    lenratio=lenSideBoundary/lenTopBotBoundary;
    powerCouplingEffSideways=-2*lenratio*mean(pwrx(indzreflec:indzLensTop,1),'omitnan');

    %Let's plot T, R, Sideways, Loss, starting at indxdim=5.
    lenTopBotBoundary=xcst(end)-xcst(1);
    indxdim1=5;
    RR=1-mean(pwr(indxdim1,:),'omitnan');
    indxdimEnd=length(zcst);
    lendim=indxdimEnd-indxdim1-2;
    TTdim=zeros(lendim,1);
    SSdim=zeros(lendim,1);
    LLdim=zeros(lendim,1);
    zdim=zeros(lendim,1);
    jj=0;
    for ii=indxdim1+1:indxdimEnd-1
        jj=jj+1;
        zdim(jj)=zcst(ii);
        TTdim(jj)=mean(pwr(ii,:),'omitnan');
        lenSideBoundary=zdim(jj)-zcst(indxdim1);
        lenratio=lenSideBoundary/lenTopBotBoundary;
        SSdim(jj)=-2*lenratio*mean(pwrx(indxdim1:ii,1),'omitnan');
        LLdim(jj)=1-(TTdim(jj)+RR+SSdim(jj));
    end
    figure
    hEff=plot(zdim/waveLength,TTdim*100,'b',...
        zdim/waveLength,SSdim*100,'g',...
        zdim/waveLength,LLdim*100,'r');
    xlabel('z/\lambda')
    ylabel('\eta (%)')
    grid
    title(['Reflection Eff = ' num2str(RR*100) ' %'])
    ylim=[-10 100];
    set(gca,'ylim',ylim)
    %draw the lens boundaries
    line([zsurf zsurf]/waveLength,ylim,'color','m')
    line([0 0],ylim,'color','m')
    legend(hEff,'transmission','sideways','absorption')

end

