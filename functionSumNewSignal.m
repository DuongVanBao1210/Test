% PHAN DOAN TIN HIEU THANH TIENG NOI VA KHOANG LANG
function result = functionSumNewSignal(x, num_frame, frame_len, Fs)
new_sig = zeros(length(x),1); % tao vector new_sig de luu gia tri bien do cua nhung cho tieng noi
arr = zeros(length(x),1); % neu tai mot khung la khoang lang va khoang lang do co do dai nho hon 200ms thi luu cac gia tri bien do cua khung do vao arr
silence = zeros(length(x),1); % tong hop cac khoang lang co do dai lon hon 200ms
count1 = 0;
count2 = 0;
time = 0; % bien time de xac dinh khoang lang da co do dai lon hon 200ms hay chua
start = 1; % phan tu dau tien cua vector silence
for k=1 : num_frame
    frame = x((k-1)*frame_len+1 : frame_len*k); % cac gia tri bien do cua x co trong khung k
 
    max_val = max(frame); % gia tri bien do lon nhat trong khung k
 
    if(max_val<0.03) % neu gia tri max be hon gia tri nguong bien do cua khoang lang dat ra ban dau la 0.03
        count1 = count1 + 1;
        arr((count1-1)*frame_len+1 : frame_len*count1) = frame;
% luu cac gia tri bien do khung do vao arr
        time = time + frame_len/Fs; % tang time neu time dang be hon 200ms
    else % neu max_val>0.03 thi co the la speech hoac noise
        if(time >= 0.2) % neu do dai silence >= 200ms thi lay, <200ms thi bo di
            silence(start : (start + frame_len*count1 - 1)) = arr(1 : frame_len*count1); % luu khoang lang co do dai >200ms vao silence
            final = start + frame_len*count1 - 1; % final la phan tu cuoi cung cua vector silence
            start = final + 1; 
            arr = zeros(length(x),1); % reset lai arr
            count1 = 0; % reset lai count1
            time = 0; % reset lai time
        else
            arr = zeros(length(x),1); % reset lai arr

            count1 = 0; % reset lai count1
            time = 0; % reset lai time
        end    
        count2 = count2 +1;
        new_sig((count2-1)*frame_len+1 : frame_len*count2) = frame;
% luu bien do cua khung vao new_sig
    end
end
new_sig(frame_len*count2 +1 :  (frame_len*count2 + final)) = silence(1 : final); % lay new_sig( = noise/speech) + silence de ra am thanh ket qua
result = new_sig(1 : (frame_len*count2 + final)); % am thanh ket qua
end
