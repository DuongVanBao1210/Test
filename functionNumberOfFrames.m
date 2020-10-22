% hàm tính các tổng số khung của tín hiệu
% trả về: tổng số frame của tín hiệu
% N: tổng số mấu của tín hiệu
% frame_len: số mẫu trên một frame
function num_frame = functionNumberOfFrames(N, frame_len)
    num_frame = floor(N/frame_len);
end
