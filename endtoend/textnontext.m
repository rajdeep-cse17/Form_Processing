function [nt]= textnontext(z,a,b,c,d,black,bw,are,i,r,c2)
elo=max(c,d)/min(c,d);
wid=c;
he=d;
hw=he/wid;
wh=wid/he;
s=black/(c*d);
nt=0;
if (wh>50||hw>50||he>0.16*r||wid>0.4*c2)
           nt=1;
elseif((wh<5||hw<5)&&s<0.2)
           nt=1;
elseif he<=15
            % nt=0;
           nt=dots(bw,are,z,a,b);
else
    ch=num2str(i);
    st=strikethrough(z);
    st2=bracket(z,i);
    if st==1||st2==1
        nt=1;
    end
end