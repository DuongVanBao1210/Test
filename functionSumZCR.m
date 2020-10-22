% hàm tính tổng số lần băng qua zero của tất cả các khung
% trả về: vector chứa tổng số lần băng qua zero của tất cả các khung 
% x: vector biên độ lấy từ âm thanh
% num_frame: tổng số frame của tín hiệu
% frame_len: số mẫu trên một frame
function countZCR = functionSumZCR(x, num_frame, frame_len)
    countZCR = zeros(1,num_frame); khai báo vector chứa giá trị trả về của hàm
    for k=1: num_frame % duyệt tất cả các khung
        tempZCR = 0; % dung bien tempZCR de luu gia tri năng lượng khung thứ k
        for j=(k-1)*frame_len+1 : (frame_len*k - 1) % duyệt qua tất cả các mẫu có trong khung
            if(x(j) * x(j+1) < 0) % kiem tra khung j và j+1 biên độ có băng qua zero không
                tempZCR = tempZCR + 1; % tăng giá biến tempZCR
            end
        end
        countZCR(k) = tempZCR; % gán lại tổng số lần zero crossing của khung thứ k và vector countZCR tại vị trí k
    end
end
