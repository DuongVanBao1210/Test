% hàm chuẩn hóa đồ thị zcr và energy về 1 thang biên độ
% trả về: 
% energy: vector chưa tất cả giá trị năng lượng của tất cả các khung
% zcr: vector chứa số lần băng qua 0 của tất cả các khung
function energryNormal = functionNormalized(energy, zcr)
    ymin = min(zcr);
    ymax = max(zcr);
    
    % chuan hoa do thi energy theo do thi zcr
    energryNormal = mapminmax(energy, ymin, ymax); 
end
