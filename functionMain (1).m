% đọc tín hiệu từ file: x chưa tất cả giá trị biên độ, Fs: tần số lấy mẫu
[x,Fs]=audioread('C:\Users\PC\Desktop\test_signals\studio_female.wav');
D = 0.01; % D (s) độ dài của một frame
frame_len = D*Fs; % frame_len: số mẫu trên một frame
N = length(x); % N: tổng số mẫu của tín hiệu
 
% tính tổng số frame
num_frame = functionNumberOfFrames(N, frame_len);
 
% vector năng lượng của tất cả khung của tín hiệu
Energy = functionSumEnergy(x, num_frame, frame_len);
 
% vector chứa số lần băng qua không của tất cả khung của tín hiệu
CountZCR = functionSumZCR(x, num_frame, frame_len);
 
% chuẩn hóa đồ thị Energy và CountZCR về cùng 1 thang biên độ
Energy = functionNormalized(Energy, CountZCR);
 
% xác định số lần giao nhau và vị trí giao nhau gần đúng của 2 đồ thị
temp = functionSumGiaoNhau(num_frame, Energy, CountZCR);
 
% tổng hợp tất cả các tiếng nói có trong tín hiệu
result = functionSumNewSignal(x, num_frame, frame_len);
 
t = length(result)/Fs; % độ dài thời gian thực (giây) của đoạn âm thanh sau khi phân đoạn
t = linspace(0, t, length(result)); % chia biến t về cùng số mẫu với result để vẽ đồ thị
plot(t, result);
title("tin hieu duoc phan doan");
xlabel("thoi gian (s)");
ylabel("bien do");
