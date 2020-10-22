% XAC DINH SO LAN GIAO NHAU VA VI TRI GIAO NHAU GAN DUNG CUA 2 DO THI
function temp = functionSumGiaoNhau(num_frame, energy, zcr)
    count = 0; % dem so lan giao nhau cua 2 do thi
    arr = zeros(1,num_frame); % tao vector arr de luu gia tri tinh toan
    for i=1 : (num_frame-1) % chay het tat cac cac khung
        if((zcr(i) > energy(i) && zcr(i+1) < energy(i+1) && (zcr(i)-energy(i))*(zcr(i+1)-energy(i+1)) < 0) || (zcr(i) < energy(i) && zcr(i+1) > energy(i+1) && (zcr(i)-energy(i))*(zcr(i+1)-energy(i+1)) < 0)) % 2 truong hop lam cho 2 do thi giao nhau xet giua 2 khung lien tiep nhau
            arr(count+1) = i; % luu vi tri diem giao nhau vao arr
            count =  count + 1; % tang so diem giao nhau len 1
        end    
    end
    temp = arr(1:count); % luu ket qua vao vector temp co do dai chinh la tong so lan giao nhau cua 2 do thi
end
