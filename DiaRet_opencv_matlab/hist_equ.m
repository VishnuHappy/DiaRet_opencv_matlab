function eq_hist = hist_equ(his,L,t)
pdf = zeros(1,256);
cdf = zeros(1,256);

for i = 1:L
    pdf(i)=his(i)/t;
    if i==1
        cdf(i) = pdf(i);
    else
        cdf(i) = pdf(i)+ cdf(i-1);
    end
end

%t=0:255;
%figure;
%title('PDF');
%stem(t,his,'g');
%figure;
%title('PDF');
%stem(t,cdf);
%hold on;

eq_hist = round(L.*cdf);