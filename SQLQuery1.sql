﻿create database QuanLyBanSach

create table KhachHang
(
	MaKH int IDENTITY PRIMARY KEY,
	HoTen nvarchar(50),
	Email nvarchar(100),
	MatKhau nvarchar(50),
	NgaySinh datetime
)

create table ChuDe
(
	MaChuDe int IDENTITY PRIMARY KEY,
	TenChuDe nvarchar(50)
)

create table NhaXuatBan
(
	MaNXB int IDENTITY PRIMARY KEY,
	TenNXB nvarchar(50),
	DiaChi nvarchar(200),
	DienThoai varchar(50)
)

create table TacGia
(
	MaTacGia int IDENTITY PRIMARY KEY,
	TenTacGia nvarchar(50),
	DiaChi nvarchar(200),
	TieuSu nvarchar(MAX),
	DienThoai nvarchar(50)
)

create table SACH
(
	MaSach int IDENTITY PRIMARY KEY,
	TenSach nvarchar(50),
	GiaBan float,
	MoTa ntext,
	AnhBia nvarchar(250),
	NgayCapNhat datetime,
	SoLuongTon int,
	MaNXB int references NhaXuatBan(MaNXB) on delete no action on update no action,
	MaChuDe int references ChuDe(MaChuDe) on delete no action on update no action,
)

create table ThamGia
(
	MaSach int references Sach(MaSach) on delete no action on update no action,
	MaTacGia int references TacGia(MaTacGia) on delete no action on update no action,
	VaiTro nvarchar(50),
	ViTri nvarchar(50),
	primary key(MaSach, MaTacGia)
)
create table DonHang
( 
	MaDonhang int IDENTITY PRIMARY KEY,
	DaThanhToan int,
	TinhTrangGiaoHang int,
	NgayDat datetime,
	NgayGia datetime,
	MaKhachHang int references KhachHang(MaKH) on delete no action on update no action,
)

create table ChiTietDonHang
(
	MaDonHang int references DonHang(MaDonHang) on delete no action on update no action,
	MaSach int references Sach(MaSach) on delete no action on update no action,
	SoLuong int,
	DonGia nchar(30)
	primary key ( MaDonHang,MaSach)
)

--INSERT TABLE CHUDE
insert into [dbo].[ChuDe]([TenChuDe]) values (N'Sách Khoa Học')
insert into [dbo].[ChuDe]([TenChuDe]) values (N'Sách Kinh Tế')
insert into [dbo].[ChuDe]([TenChuDe]) values (N'Sách Thiếu Nhi')
insert into [dbo].[ChuDe]([TenChuDe]) values (N'Sách Giáo Khoa - Giáo Trình')
insert into [dbo].[ChuDe]([TenChuDe]) values (N'Tạp Chí - Văn Phòng Phẩm')
insert into [dbo].[ChuDe]([TenChuDe]) values (N'Sách Văn Học')

--INSERT TABLE TACGIA
insert into [dbo].[TacGia]([TenTacGia],[DiaChi],[TieuSu],[DienThoai]) values (N'KimDong',N'68 Nguyen Trai , Ha noi ', 'NhaVan ','0345.32533')

--INSERT TABLE NXB
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh',N'62 Nguyễn Thị Minh Khai, Phường Đa Kao, Quận 1, TP.HCM','(028) 38 225 340')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản Trẻ',N'161B Lý Chính Thắng, Phường 7, Quận 3, Thành phố Hồ Chí Minh','(028) 39316289')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản Kim Đồng',N'55 Quang Trung, Hai Bà Trưng, Hà Nội',' 02439434730')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản chính trị quốc gia', N'Số 6/86 Duy Tân, Cầu Giấy, Hà Nội','0280.49221')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản giáo dục',N'81 Trần Hưng Đạo, Hà Nội','024.38220801')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản Hội Nhà văn',N'Số 65 Nguyễn Du, Hà Nội','024.38222135')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản Tư pháp',N'Số 35 Trần Quốc Toản, Hoàn Kiếm, Hà Nội','024.62632078')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản thông tin và truyền thông',N'Tầng 6, Tòa nhà Cục Tần số Vô tuyến điện, số 115 Trần Duy Hưng, Hà Nội ',' 024 35772145')
insert into [dbo].[NhaXuatBan]([TenNXB],[DiaChi],[DienThoai]) values (N'Nhà xuất bản lao động',N'175 Giảng Võ, Đống Đa, Hà Nội','0243.8515380')

--INSERT TABLE  SACH
--SÁCH KHOA HỌC
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values (N'Các Chất Và Hỗn Hợp',23040,N'Các Chất Và Hỗn Hợp (2018)Có một điều mà tôi đã học được trong cả cuộc đời: Rằng khoa học của chúng ta,khi đem đo lường với thực tại, là rất thô sơ và ngô nghê, nhưng lại là điều quý giá nhất mà chúng tacó. - Albert Einstein.Khoa học đã tiến những bước dài suốt 150 năm qua, mang về những thành tựu quí giá, đưa con người phát triển lên một tầm cao mới. Thật tuyệt vời khi những độc giả trẻ ngày nay say mê khám phá, tìm tòi những thông tin khoa học, tò mò bất tận về cách thức vũ trụ vận hành và không ngừng đặt ra những câu hỏi TẠI SAO? NHƯ THẾ NÀO?  - những câu hỏi nhỏ làm nên những khác biệt lớn, những viên gạch đầu tiên cho những nghiên cứu và phát triển trong tương lai',N'assets/img/sach-khoa-hoc/cac-hop-chat-va-hon-hop.jpg','03/11/2017',230,1,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values (N'Chuyển Đổi Lớn',63180,N'Chuyển đổi lớn, quyển sách best-seller của tác giả Nicholas Carr hướng chúng ta đến cuộc cách mạng mới liên quan đến máy tính, và đưa ra một thông điệp tuy đơn giản nhưng thật sâu sắc: điện toán đang dần trở thành một loại dịch vụ tiện ích mang tính đại chúng, và hệ quả của quá trình này sẽ thay đổi triệt để xã hội của chúng ta, cũng giống như điện giá rẻ đã từng làm được trong thế kỷ XIX. Dù ở lĩnh vực phần mềm hay lĩnh vực báo chí, dù đang sản xuất hàng hóa hay đang cung cấp dịch vụ, dù ở tầm an ninh quốc phòng hay chỉ ở mức riêng tư cá nhân... Chuyển đổi lớn đều mang đến một cái nhìn vừa sâu vừa rộng về một thế giới mới đang được tạo ra bởi những vòng xoáy của chiếc Máy Tính Toàn Cầu.',N'assets/img/sach-khoa-hoc/cac-hop-chat-va-hon-hop.jpg','03/09/2018',30,1,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Lực Và Năng Lượng',32000,N'Lực Và Năng Lượng (2018)Có một điều mà tôi đã học được trong cả cuộc đời: Rằng khoa học của chúng ta, khi đem đo lường với thực tại, là rất thô sơ và ngô nghê, nhưng lại là điều quý giá nhất mà chúng ta có. - Albert Einstein.Khoa học đã tiến những bước dài suốt 150 năm qua, mang về những thành tựu quí giá, đưa con người phát triển lên một tầm cao mới. Thật tuyệt vời khi những độc giả trẻ ngày nay say mê khám phá, tìm tòi những thông tin khoa học, tò mò bất tận về cách thức vũ trụ vận hành và không ngừng đặt ra những câu hỏi TẠI SAO? NHƯ THẾ NÀO?  - những câu hỏi nhỏ làm nên những khác biệt lớn, những viên gạch đầu tiên cho những nghiên cứu và phát triển trong tương lai.',N'assets/img/sach-khoa-hoc/luc-va-nang-luong.jpg','11/12/2018',50,1,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Lược Sử Vạn Vật',199000,N'Lược sử vạn vật là cuốn sách phổ biến khoa học trình bày một cách ngắn gọn lịch sử nghiên cứu khoa học tự nhiên,những thành tựu khoa học trong các lĩnh vực khoa học tự nhiên chính: vật lý,hóa học,sinh học, địa chất,thiên văn...với nhiều tên tuổi, giai thoại và sự thật.Với cuốn sách này,người đọc sẽ biết được những giới hạn trong tri thức của con người về vũ trụ và cả về chính trái đất.Đây là cuốn sách khoa học phổ thông bán chạy nhất nước Anh năm 2005 với hơn 300.000 bản in. Nhà phê bình người Anh,Craig Brown thậm chí đã nhận xét rằng tác phẩm này xứng đáng bán được 500.000.000.000 cuốn(theo cách nói của chính Bryson, bằng với số proton có trong một dấu chấm câu).William McGuire Bill Bryson,tác giả cuốn sách Lược sử vạn vật - A Short History of Nearly Everything sinh năm 1951,là tác giả nổi tiếng hàng đầu trong thể loại non - fiction ở Bắc Mỹ,với vô số người hâm mộ trên khắp thế giới.',N'assets/img/sach-khoa-hoc/luoc-su-van-vat.jpg','03/11/2018',20,2,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Phát Minh Cuối Cùng',144300,N'Trí tuệ nhân tạo giúp bạn chọn những cuốn sách bạn mua, những bộ phim bạn xem, và thậm chí những người bạn hẹn hò. Nó có trong điện thoại thông minh của bạn và tới đây sẽ lái chiếc xe của bạn. Nó thực hiện hầu hết các giao dịch trên Wall Street, và kiểm soát cơ sở hạ tầng điện, nước và giao thông. Nhưng trí tuệ nhân tạo cũng có thể đe dọa sự tồn tại của con người.Chỉ trong một thập kỷ,AI có thể đạt ngang ngửa và sau đó vượt qua trí thông minh của con người.Các công ty và cơ quan chính phủ đang rót hàng tỷ đô - la để thu được một AI với trí thông minh ở cấp độ con người.Một khi AI đã phát triển đến mức này,các nhà khoa học lập luận rằng,nó sẽ có những động lực sống giống như con người.Chúng ta có thể sẽ buộc phải cạnh tranh với một kẻ thù ngoan cường hơn,mạnh mẽ hơn và khác biệt hơn chúng ta tưởng tượng.Thông qua việc phỏng vấn với những người có tầm nhìn xa về công nghệ,các cơ quan giám sát công nghiệp,và những hệ thống AI, cuốn sách Phát minh cuối cùng khám phá những nguy cơ của việc theo đuổi AI cao cấp.Cho đến nay,trí thông minh của con người không có đối thủ.Liệu chúng ta có thể cùng tồn tại với những thứ mà trí tuệ của chúng ta trở nên nhỏ bé hơn hẳn ? Và liệu chúng sẽ cho phép chúng ta cùng tồn tại ?',N'assets/img/sach-khoa-hoc/phat-minh-cuoi-cung.jpg','03/11/2018',5,2,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Sài Gòn Then & Now ',266250,N'Sài Gòn then & now hay Sài Gòn hai đầu thế kỷ dẫn bạn đọc đi qua biến đổi cảnh quan và kiến trúc của Sài Gòn ở đầu thế kỷ 20 và đầu thế kỷ 21. Chúng ta sẽ gặp lại nhà thờ Đức Bà của những năm 1920 vẫn giữ nguyên hình dáng cho đến ngày nay, là nơi nhiều bạn trẻ chọn làm nơi ghi lại kỷ niệm của hạnh phúc, bởi kiến trúc độc đáo của nó. Hay chúng ta sẽ biết rằng một phần Nhà văn hoá quận Một ngày nay là nhà thờ Tin Lành được xây dựng năm 1905; Khách sạn Bông Sen và nhà hàng Brodard hiện nay được xây trên nền toà nhà hiệu thuốc Normale; phố đi bộ Nguyễn Huệ ngày nay là khu vực Toà hoà giải xưa, nơi chính quyền Pháp từng đặt máy chém để xử trảm tội nhân …',N'assets/img/sach-khoa-hoc/sai-gon-then-and-now.jpg','11/11/2018',25,2,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Vạn Vật Vận Hành',449250,N'Vạn vật vận hành như thế nào? mô tả phần lớn các phát minh của thế giới hiện đại, giúp ta có cái nhìn sâu hơn về cơ chế hoạt động của các vật dụng tưởng chừng rất tầm thường. Được lồng ghép với một nhân vật thô kệch mà dễ thương (voi ma-mút lông), dưới lời dẫn truyện của một nhà phát minh ngờ nghệch nhưng đầy tham vọng thời tiền sử, cuốn sách này hứa hẹn là tác phẩm gần gũi với mọi lứa tuổi độc giả đam mê tìm tòi và có óc phiêu lưu hài hước.Đây sẽ là món quà tặng tuyệt vời cho mọi độ tuổi,miễn là có đam mê tìm tòi học hỏi về khoa học, kỹ thuật, cơ khí,điện tử,hoặc những độc giả chán chường với những cuốn sách khô khan về các lĩnh vực trên.Ta có thể bắt đầu đọc ở bất kỳ nơi nào của sách.',N'assets/img/sach-khoa-hoc/van-vat-van-hanh.jpg','11/09/2018',10,2,1)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Vũ Trụ Toàn Ảnh',142500,N'Cuốn sách giải thích những điều kỳ lạ, những phép lạ tôn giáo, trải nghiệm cận tử, thoát xác, những khả năng phi thường của con người bằng nguyên lý toàn ảnh dựa trên ý tưởng cho rằng vũ trụ là một ảnh toàn ký khổng lồ.Song song với sự phát triển của khoa học, những điều huyền bí vẫn tồn tại bất chấp các định lý, định luật và điều kiện của tự nhiên mà khoa học hiện đại tuân theo. Đối mặt với vấn đề này, hầu hết các nhà khoa học lựa chọn từ bỏ, phủ nhận những điều huyền bí, một số người cực đoan thậm chí quy kết tất cả những gì siêu nhiên là mê tín. Mặc dù vậy, vẫn có những người tiếp tục nghiên cứu mặc sự dèm pha của đồng nghiệp. Michael Talbot là một trong số đó. Trong cuốn sách Vũ trụ toàn ảnh, ông đã đề xuất ý tưởng cho rằng toàn bộ vũ trụ là một cơ thể khổng lồ, không thể chia tách, là một ảnh toàn ký mà dù có chia nhỏ đến đâu vẫn cho ra hình ảnh nguyên vẹn. Theo quan niệm này, ông đã giải thích những điều kỳ lạ, những phép lạ tôn giáo, trải nghiệm cận tử, thoát xác, những khả năng phi thường của con người – tiên tri, thấu thị, cơ thể không bị tổn thương, đi trên dung nham nóng chảy, chữa bệnh bằng sức mạnh tinh thần… – bằng nguyên lý toàn ảnh, dựa trên những chứng cứ mà ông thu thập được và chính từ trải nghiệm của bản thân. Qua đó, ông cũng phần nào giải thích vì sao những hiện tượng siêu nhiên hay khả năng đặc biệt phần lớn được những người theo những nền văn hóa cổ trải nghiệm mà không phải những người thông thái theo trường phái hiện đại. Ý thức và niềm tin chính là chìa khóa cho vấn đề này.',N'assets/img/sach-khoa-hoc/vu-tru-toan-anh.jpg','10/12/2018',12,2,1)

--SÁCH KINH TẾ
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Bí Mật Thế Giới LoGo',108770,N'Nếu bạn là một người say mê đồ chơi LEGO, đây là cuốn sách bạn nên đọc.Nếu bạn là người quan tâm tới việc điều hành một doanh nghiệp và quá trình đổi mới, sáng tạo (innovation) trong môi trường kinh doanh, đây là cuốn sách bạn PHẢI đọc.Đây không phải là cuốn biên niên sử về Tập đoàn LEGO, một trong những công ty đồ chơi lớn nhất thế giới. Nhưng đây là thiên sử thi về hành trình đổi mới để từ một công ty đứng bên bờ vực thẳm, LEGO trở thành nhà sản xuất đồ chơi có tốc độ tăng trưởng mạnh mẽ nhất thế giới và luôn mang đến cho khách hàng, từ người lớn cho đến trẻ em, những bất ngờ dường như vô tận.Thông qua các sự kiện, cuộc phỏng vấn cũng như số liệu, tác giả David C. Robertson mang đến cho chúng ta những bài học tuyệt vời về cuộc chiến đầy cam go mà Tập đoàn LEGO đã phải trải qua. Có những điều mà chúng ta tưởng là chân lý, nhưng để áp dụng được chúng đòi hỏi sự sáng tạo, linh hoạt và nhạy bén với thời cuộc. Và rốt cuộc, dù đổi mới bao nhiêu đi chăng nữa, LEGO cũng trở lại với tôn chỉ mà nhà sáng lập Ole Kirk Christiansen đã đề ra: Chỉ có điều tốt nhất mới là đủ.Chắc chắn, cuốn sách sẽ mang đến những cảm xúc mãnh liệt về hành trình của Tập đoàn LEGO và giúp ích cho bạn trên con đường xây dựng cơ nghiệp của chính mình.',N'assets/img/sach-kinh-te/bi-mat-the-gioi-logo.jpg','03/11/2018',25,4,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Vũ Trụ Toàn Ảnh',142500,N'Nếu bạn là một người say mê đồ chơi LEGO, đây là cuốn sách bạn nên đọc.Nếu bạn là người quan tâm tới việc điều hành một doanh nghiệp và quá trình đổi mới, sáng tạo (innovation) trong môi trường kinh doanh, đây là cuốn sách bạn PHẢI đọc.Đây không phải là cuốn biên niên sử về Tập đoàn LEGO, một trong những công ty đồ chơi lớn nhất thế giới. Nhưng đây là thiên sử thi về hành trình đổi mới để từ một công ty đứng bên bờ vực thẳm, LEGO trở thành nhà sản xuất đồ chơi có tốc độ tăng trưởng mạnh mẽ nhất thế giới và luôn mang đến cho khách hàng, từ người lớn cho đến trẻ em, những bất ngờ dường như vô tận.Thông qua các sự kiện, cuộc phỏng vấn cũng như số liệu, tác giả David C. Robertson mang đến cho chúng ta những bài học tuyệt vời về cuộc chiến đầy cam go mà Tập đoàn LEGO đã phải trải qua. Có những điều mà chúng ta tưởng là chân lý, nhưng để áp dụng được chúng đòi hỏi sự sáng tạo, linh hoạt và nhạy bén với thời cuộc. Và rốt cuộc, dù đổi mới bao nhiêu đi chăng nữa, LEGO cũng trở lại với tôn chỉ mà nhà sáng lập Ole Kirk Christiansen đã đề ra: Chỉ có điều tốt nhất mới là đủ.Chắc chắn, cuốn sách sẽ mang đến những cảm xúc mãnh liệt về hành trình của Tập đoàn LEGO và giúp ích cho bạn trên con đường xây dựng cơ nghiệp của chính mình.',N'assets/img/sach-kinh-te/cam-on-vi-den-tre.jpg','11/11/2018',30,4,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Để Thế Giới Biết Bạn Là Ai',84960,N'Đây là một cuốn sách về nghệ thuật bán hàng, nhưng nó lại không dạy bạn cách để bán một món hàng cụ thể. Có một sự thật là tất cả chúng ta đều là người bán hàng, bất kể chúng ta là ai, theo nghề nghiệp gì, hoạt động trong lĩnh vực nào, bất kể đâu là đam mê mà ta đang theo đuổi. Bạn không nhất thiết phải bán một món hàng cụ thể mới là người bán hàng, mỗi lúc bạn chuyện trò cùng ai đó, chia sẻ một ý kiến, giải thích một ý tưởng, chính là bạn đang bán ra món sở hữu giá trị nhất của bạn – chính bạn.  Mọi dịch vụ, trí tuệ, ý tưởng, kỹ năng của bạn đều là một “món hàng” mà bạn bán ra cho đời, để thu về sự thịnh vượng cả về vật chất lẫn tinh thần. Hơn ba mươi chương sách là những phân tích, dẫn chứng và những đúc kết sâu sắc về việc bạn làm thế nào nổi bật lên được giá trị bản thân, làm thế nào thể hiện được trọn vẹn khả năng, tiềm năng của mình, và làm thế nào để được công nhận đúng với giá trị thật của bạn. Bạn có thể là một tài năng xuất chúng, có thể là người dồi dào những ý tưởng tuyệt vời, bạn có thể có những kỹ năng xuất sắc, nhưng nếu bạn không biết cách thể hiện và phát huy chúng, không biết cách quảng bá chính mình, bạn vẫn sẽ mãi là con số không giữa đám đông những người kém cỏi hơn mình.',N'assets/img/sach-kinh-te/de-the-gioi-biet-ban-la-ai.jpg','03/11/2018',50,2,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Internet Của Tiền Tệ',142500,N'Cuốn sách là tập hợp các bài nói chuyện của Andreas M. Antonopoulos, một trong những chuyên gia hàng đầu thế giới về blockchain và bitcoin. Những bài nói chuyện của ông đã góp phần giúp cho một lĩnh vực vẫn còn mới mẻ, lạ lẫm và phức tạp như blockchain và bitcoin trở nên dễ hiểu và gần gũi hơn.Trong cuốn sách này, tác giả sẽ lý giải tại sao bitcoin lại là một bước đột phá về công nghệ và tài chính với những tiềm năng vượt ra ngoài tên gọi “tiền kỹ thuật số” của nó hiện nay.Đặc biệt,tác giả còn mở rộng vấn đề, bàn đến những ý nghĩa về mặt triết học,xã hội và lịch sử của bitcoin, chính trị, và kinh tế thông qua mạng lưới phi tập trung phi tín nhiệm của bitcoin.',N'assets/img/sach-kinh-te/internet-cua-tien-te.jpg','03/11/2018',15,4,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'MBA Căn Bản',111750,N'Quản trị kinh doanh không còn là lĩnh vực mới lạ, thậm chí đã phát triển lên đến đỉnh cao trong những năm gần đây. Từ những khái niệm thô sơ coi quản trị đồng nhất với quản lí, từ chỗ chỉ coi việc điều hành kinh doanh đơn thuần tập trung vào quản lí con người...; quản trị kinh doanh hay MBA hiện đã phân tách thành nhiều chuyên ngành riêng biệt, hàm chứa lượng kiến thức tổng hợp rộng lớn. Giờ đây nhắc tới quản trị kinh doanh, ta không thể không đề cập đến marketing, quản lí dự án, quản lí chiến lược, đầu tư tự doanh, tài chính, kế toán… Là một người nuôi dưỡng khát khao khởi nghiệp, hoặc muốn đưa doanh nghiệp của mình tiến lên tầm cao mới, bạn không thể không trang bị những kiến thức mang tính nền tảng cho kinh doanh này. Nhưng bạn phải bắt đầu từ đâu?',N'assets/img/sach-kinh-te/mba-can-ban.jpg','11/09/2018',26,5,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Sáng Tư Duy Tạo Ý Tưởng',57670,N'Khi nhắc đến sự sáng tạo, nhiều người chỉ liên tưởng tới hình ảnh nghệ sĩ, nhà văn, nhà thiết kế, nhà làm phim, chứ không phải lập trình viên hay luật sư, nhân viên marketing và kế toán. Nhưng chính họ ‒ những người đã hình dung ra các sàn đấu giá trực tuyến, đơn giản hóa các dịch vụ pháp lý và đơn từ, kết nối những người có xe với những người có nhu cầu đi lại, tìm ra cách dễ dàng hơn để tính toán sổ sách trong những doanh nghiệp nhỏ ‒ đã lần lượt tạo ra eBay, LegalZoom, Uber và QuickBooks. Sự thật là ai cũng có khả năng sáng tạo và bạn có thể phát triển kỹ năng sáng tạo vốn có của mình hệt như bất kỳ kỹ năng nào khác.Cuốn sách Sáng tư duy, tạo ý tưởng này sẽ cho chúng ta thấy sự sáng tạo không thuộc về riêng ai. Tất cả chúng ta đều có. Nhưng chúng ta cần một tư duy cầu tiến với niềm tin có thể học hỏi và phát triển trí thông minh vượt xa những gì được ban cho khi sinh ra. Chúng ta cần tập hợp đội ngũ đa dạng gồm những người “tư duy khác biệt” song đều đồng tình với vấn đề trước mắt và gắng sức cùng nhau giải quyết. Muốn thật sự có hiệu quả, chúng ta cần áp dụng các công cụ động não trong khoảng thời gian giới hạn với tâm thế rằng, ban đầu có thật nhiều ý tưởng thì tốt hơn là chỉ có vài ý tưởng hay. Còn nếu chúng ta làm việc trong một công ty, người quản lý cấp cao phải tạo ra môi trường thích hợp để sự sáng tạo được nở rộ.',N'assets/img/sach-kinh-te/sang-tu-duy-tao-y-tuong.jpg','11/09/2018',8,8,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Thuật Marketing',59250,N'Bạn là doanh nghiệp khởi nghiệp? Bạn là quản lý cấp trung trong doanh nghiệp đang tăng trưởng, hay trong tập đoàn đa quốc gia? Bạn đang đau đầu tìm cách tăng thị phần, tăng doanh số bán hàng? Khát khao tìm cách thúc đẩy nhân viên trở nên xuất sắc? v.v...Nếu những câu hỏi trên là nỗi băn khoăn của bạn, làm bạn trăn trở mỗi đêm, thì cuốn sách Thuật Marketing của Brian Tracy sẽ là cẩm nang hữu ích dành cho bạn. Bởi lẽ, nguyên nhân chính dẫn đến sự thành bại của một doanh nghiệp được xác định bởi sự thăng trầm của nỗ lực marketing.Thuật Marketing đưa đến cho bạn 21 hướng dẫn thiết yếu, những ý tưởng tiếp thị mạnh mẽ mà bạn có thể sử dụng tức thời. Bạn sẽ khám phá ra cách:Xây dựng nền tảng khách hàng của bạn,Đặt mình nằm ngoài hoạt động cạnh tranh,Trả lời ba câu hỏi quan trọng về bất kỳ sản phẩm hay dịch vụ mới nào,Thúc đẩy nghiên cứu thị trường và tập trung các nhóm để ra quyết định tốt hơn,Đáp ứng nhu cầu cảm xúc cơ bản của người mua,Tận dụng tối đa các kênh phân phối của bạn,Và…..còn nhiều hơn nữa!',N'assets/img/sach-kinh-te/thuat-marketing.jpg','03/11/2018',25,5,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Thực Thi',111750,N'Chúng ta đã quá quen thuộc với chức danh CEO (Chief Executive Officer) được dịch là Giám đốc điều hành, đến mức một cách mặc định hầu hết chúng tôi đều nghĩ rằng Execution hay Executive có nghĩa là Điều hành, có lẽ để tựa đề quyển sách này là Điều hành thì sẽ kêu hơn là Thực thi. Nhưng điều mà hai tác giả Larry Bossidy và Ram Charan muốn nhấn mạnh qua quyển sách này là hầu hết các lãnh đạo của chúng ta đã quá mơ mộng và tự bằng lòng với chức danh Điều hành mà quên mất bản chất công việc của một nhà lãnh đạo là Thực hiện và thi hành các kế hoạch đã được đặt ra, là làm tất cả những gì có thể, để chiến lược không chỉ là những câu chữ hào sảng, giấy tờ, mà sẽ mang lại những thay đổi tích cực và dẫn dắt doanh nghiệp đến những tầm cao hơn. Đề ra chiến lược chưa đủ, một người lãnh đạo giỏi thực sự phải là người biết thực thi.Thực Thi được viết theo lối đàm thoại với độc giả và hai tác giả thay nhau nói về các ví dụ thực tiễn đầy sinh động của mình để minh họa cho các ý tưởng chủ đạo. Đôi khi Larry và Ram phải thay tên công ty thành XYZ, thay tên người thành Peter X, nhưng những câu chuyện hai người kể đều rất gần gũi và quen thuộc với bất kì một lãnh đạo nào, dù là ở vị trí tổng giám đốc hay giám đốc bộ phận.',N'assets/img/sach-kinh-te/thuc-thi.jpg','03/11/2018',30,5,2)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Trên Đỉnh Phố Wall',134250,N'Peter Lynch là nhà quản lý tài chính số 1 ở Mỹ. Quan điểm của ông là: Tất cả các nhà đầu tư trung bình đều có thể trở thành những chuyên gia hàng đầu trong lĩnh vực của họ và họ có thể chọn được những cổ phiếu hời nhất không kém gì các chuyên gia đầu tư trên Phố Wall chỉ bằng việc thực hiện một cuộc điều tra nhỏ.Trong cuốn sách, Lynch đề cập đến cách thức mà ông đã đạt được thành tích đầu tư vĩ đại của mình khi là cựu giám đốc xuất sắc của quỹ đầu tư hàng tỷ đô-la Magellan. Viết cùng Joghn Rothchild, Trên đỉnh Phố Wall đưa ra những chỉ dẫn dễ dàng áp dụng để có thể lựa chọn được những danh mục từ việc đánh giá các báo cáo tài chính của công ty và nhận ra những con số thực sự có giá trị. Ông giải thích và đưa ra những chỉ dẫn để đầu tư theo chu kỳ, hay thay đổi hoàn toàn danh mục đầu tư để theo đuổi những công ty đang phát triển nhanh.Lynch khẳng định rằng, nếu bạn không bị chi phối bởi sự thất thường của thị trường sự ham muốn tức thời về lợi nhuận, bạn sẽ được đền đáp bởi danh mục đầu tư của mình, (sau khoảng từ 5 đến 15 năm). Lời khuyên này đã được chứng minh là sống mãi với thời gian và đã biến Trên đỉnh Phố Wall trở thành tác phẩm bán chạy số 1 ở Mỹ. Và cho đến bây giờ, cuốn sách kinh điển này vẫn giữ nguyên giá trị ban đầu của nó.',N'assets/img/sach-kinh-te/tren-dinh-pho-wall.jpg','03/11/2018',40,8,2)

--SÁCH THIẾU NHI
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Biết Cho Đi Và Nhận Lại',30420,N'Chúng ta không còn xa lạ gì với khái niệm IQ – Chỉ số thông minh, EQ – Chỉ số cảm  xác nhưng khi nhắc đến FQ – chỉ số thông minh về tài chính thì nhiều phụ huynh rất ít biết đến. Phần lớn, các bố mẹ đều rất ngại hoặc không muốn đề cập tới chuyện tiền bạc với con trẻ vì sợ những suy nghĩ về tiền bạc sẽ làm vẩn đục tâm hồn trong sáng và tuổi thơ của các con. Không có ít trường hợp, trẻ không phân biệt được tiền bạc và coi tiền không khác gì tờ giấy, có thể vứt tùy tiện mọi chỗ. Vì được bố mẹ quá bao bọc mà không biết đến giá trị của tiền bạc được tính bằng sức lao động. Ông bà ta có câu Nhìn ba tuổi biết lúc trưởng thành, nhìn bảy tuổi biết lúc tuổi già để khái quát sự phát triển của trẻ nhỏ. Giai đoạn từ 0 – 6 tuổi được coi là giai đoạn vàng, giai đoạn đặt nền móng cho sự phát triển của trẻ. Chính vì vậy bố mẹ đừng bỏ qua giai đoạn này nhé. Các chuyên gia giáo dục khuyên rằng, bồi dưỡng FQ cho trẻ thì nên bắt đầu từ 3 tuổi. Bố mẹ nên dạy con giá trị của đồng tiền là gì? Giá trị của những đồ vật quen thuộc xung quanh? Giá trị của sức lao động.',N'assets/img/sach-thieu-nhi/biet-cho-di-va-nhan-lai.jpg','03/11/2018',17,3,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Chuyện Kể Thành Ngữ',32390,N'Chuyện Kể Thành Ngữ Vì sao người nào ngoan cố, không chịu sửa chữa tính xấu, hay bị ví là Chó đen giữ mực?Nắc nẻ trong Cười như nắc nẻ là gì?Voi và tiên trong Được voi đòi tiên có phải là con voi và cô tiên?Các lí giải trong chuyện kể thành ngữ sẽ khiến bạn ngạc nhiên và vô cùng thích thú',N'assets/img/sach-thieu-nhi/chuyen-ke-thanh-ngu.jpg','06/09/2018',40,3,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Đồng Tiền Quý Giá ',30420,N'Chúng ta không còn xa lạ gì với khái niệm IQ – Chỉ số thông minh, EQ – Chỉ số cảm  xác nhưng khi nhắc đến FQ – chỉ số thông minh về tài chính thì nhiều phụ huynh rất ít biết đến. Phần lớn, các bố mẹ đều rất ngại hoặc không muốn đề cập tới chuyện tiền bạc với con trẻ vì sợ những suy nghĩ về tiền bạc sẽ làm vẩn đục tâm hồn trong sáng và tuổi thơ của các con. Không có ít trường hợp, trẻ không phân biệt được tiền bạc và coi tiền không khác gì tờ giấy, có thể vứt tùy tiện mọi chỗ. Vì được bố mẹ quá bao bọc mà không biết đến giá trị của tiền bạc được tính bằng sức lao động. Ông bà ta có câu Nhìn ba tuổi biết lúc trưởng thành, nhìn bảy tuổi biết lúc tuổi già để khái quát sự phát triển của trẻ nhỏ. Giai đoạn từ 0 – 6 tuổi được coi là giai đoạn vàng, giai đoạn đặt nền móng cho sự phát triển của trẻ. Chính vì vậy bố mẹ đừng bỏ qua giai đoạn này nhé. Các chuyên gia giáo dục khuyên rằng, bồi dưỡng FQ cho trẻ thì nên bắt đầu từ 3 tuổi. Bố mẹ nên dạy con giá trị của đồng tiền là gì? Giá trị của những đồ vật quen thuộc xung quanh? Giá trị của sức lao động.',N'assets/img/sach-thieu-nhi/dong-tien-quy-gia.jpg','11/11/2018',30,3,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Đừng Phung Phí',58250,N'Chúng ta không còn xa lạ gì với khái niệm IQ – Chỉ số thông minh, EQ – Chỉ số cảm  xác nhưng khi nhắc đến FQ – chỉ số thông minh về tài chính thì nhiều phụ huynh rất ít biết đến. Phần lớn, các bố mẹ đều rất ngại hoặc không muốn đề cập tới chuyện tiền bạc với con trẻ vì sợ những suy nghĩ về tiền bạc sẽ làm vẩn đục tâm hồn trong sáng và tuổi thơ của các con. Không có ít trường hợp, trẻ không phân biệt được tiền bạc và coi tiền không khác gì tờ giấy, có thể vứt tùy tiện mọi chỗ. Vì được bố mẹ quá bao bọc mà không biết đến giá trị của tiền bạc được tính bằng sức lao động. Ông bà ta có câu Nhìn ba tuổi biết lúc trưởng thành, nhìn bảy tuổi biết lúc tuổi già để khái quát sự phát triển của trẻ nhỏ. Giai đoạn từ 0 – 6 tuổi được coi là giai đoạn vàng, giai đoạn đặt nền móng cho sự phát triển của trẻ. Chính vì vậy bố mẹ đừng bỏ qua giai đoạn này nhé. Các chuyên gia giáo dục khuyên rằng, bồi dưỡng FQ cho trẻ thì nên bắt đầu từ 3 tuổi. Bố mẹ nên dạy con giá trị của đồng tiền là gì? Giá trị của những đồ vật quen thuộc xung quanh? Giá trị của sức lao động.',N'assets/img/sach-thieu-nhi/dung-phung-phi.jpg','03/11/2018',50,3,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Kì Nghỉ Của Chuột Bưu Tá',32400,N'Kì Nghỉ Của Chuột Bưu TáChuột Bưu Tá lên đường đi nghỉ cùng gia đình. Nhưng chẳng nhẽ phải gác việc đưa thư lại? Trong rừng già hay ở địa cực băng giá, trên bãi biển hay trên lưng lạc đà, chú tiếp tục chuyển các bưu phẩm,với sự trợ giúp của vợ mình là thím Chuột và ba đứa con thơ.Bé hãy cùng đi du lịch với các con vật vô cùng dễ thương.Có cả nghìn lẻ một chuyện đang chờ bé theo từng trang sách đấy!CUỐN SÁCH GIÚP BÉ PHÁT TRIỂN KHẢ NĂNG NGÔN NGỮ, TRÍ TƯỞNG TƯỢNG VÀ ÓC QUAN SÁT.Nhà bạn Chim ở đâu?Vì sao bạn Kiến này lại đội vương miện? Vì sao giường của các bạn Dơi lại lộn ngược như vậy?Còn rất nhiều hoạt động bổ ích và lí thú khác mà bố mẹ có thể trải nghiệm cùng con khi khám phá cuốn sách này.',N'assets/img/sach-thieu-nhi/ki-nghi-cua-chuot-buu-ta.jpg','11/11/2018',60,3,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Tiền Từ Đâu Tới',30420,N'Chúng ta không còn xa lạ gì với khái niệm IQ – Chỉ số thông minh, EQ – Chỉ số cảm  xác nhưng khi nhắc đến FQ – chỉ số thông minh về tài chính thì nhiều phụ huynh rất ít biết đến. Phần lớn, các bố mẹ đều rất ngại hoặc không muốn đề cập tới chuyện tiền bạc với con trẻ vì sợ những suy nghĩ về tiền bạc sẽ làm vẩn đục tâm hồn trong sáng và tuổi thơ của các con. Không có ít trường hợp, trẻ không phân biệt được tiền bạc và coi tiền không khác gì tờ giấy, có thể vứt tùy tiện mọi chỗ. Vì được bố mẹ quá bao bọc mà không biết đến giá trị của tiền bạc được tính bằng sức lao động. Ông bà ta có câu Nhìn ba tuổi biết lúc trưởng thành, nhìn bảy tuổi biết lúc tuổi già để khái quát sự phát triển của trẻ nhỏ. Giai đoạn từ 0 – 6 tuổi được coi là giai đoạn vàng, giai đoạn đặt nền móng cho sự phát triển của trẻ. Chính vì vậy bố mẹ đừng bỏ qua giai đoạn này nhé. Các chuyên gia giáo dục khuyên rằng, bồi dưỡng FQ cho trẻ thì nên bắt đầu từ 3 tuổi. Bố mẹ nên dạy con giá trị của đồng tiền là gì? Giá trị của những đồ vật quen thuộc xung quanh? Giá trị của sức lao động.',N'assets/img/sach-thieu-nhi/tien-tu-dau-toi.jpg','03/11/2018',24,5,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Tiết Kiệm Như Thế Nào?',56.431,N'Kì Nghỉ Của Chuột Bưu TáChuột Bưu Tá lên đường đi nghỉ cùng gia đình. Nhưng chẳng nhẽ phải gác việc đưa thư lại? Trong rừng già hay ở địa cực băng giá, trên bãi biển hay trên lưng lạc đà, chú tiếp tục chuyển các bưu phẩm,với sự trợ giúp của vợ mình là thím Chuột và ba đứa con thơ.Bé hãy cùng đi du lịch với các con vật vô cùng dễ thương.Có cả nghìn lẻ một chuyện đang chờ bé theo từng trang sách đấy!CUỐN SÁCH GIÚP BÉ PHÁT TRIỂN KHẢ NĂNG NGÔN NGỮ, TRÍ TƯỞNG TƯỢNG VÀ ÓC QUAN SÁT.Nhà bạn Chim ở đâu?Vì sao bạn Kiến này lại đội vương miện? Vì sao giường của các bạn Dơi lại lộn ngược như vậy?Còn rất nhiều hoạt động bổ ích và lí thú khác mà bố mẹ có thể trải nghiệm cùng con khi khám phá cuốn sách này.',N'assets/img/sach-thieu-nhi/tiet-kiem-nhu-the-nao.jpg','03/11/2018',35,5,3)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Truyện Cổ Nước Nam',43200,N'Truyện cổ nước Nam tập hợp hơn 200 truyện cổ, sự tích về con người và muôn loài nước Việt đã lưu truyền trong đời sống dân gian từ xa xưa cho đến tận ngày nay, được học giả Ôn Như Nguyễn Văn Ngọc dày công lưu giữ, tuyển chọn và biên soạn. Đó là những truyện cổ làm cho nước Nam mới thật là nước Nam vậy, một kho vàng vô giá của ông cha để lại làm cái vốn rất quý cho con cháu, bởi làm người Nam nên biết truyện cổ nước Nam. Tinh thần người Nam hiện ra ở đấy, tinh hoa nước Nam muốn lưu lại cũng ở đấy.Những truyện cổ chúng tôi sưu tập đây, chúng tôi dám quyết rằng thật là của riêng của nước Nam, tự người Nam sáng tác, xuất sản ra, chứ không phải đi vay, đi mượn, nhờ vả vào ai mà được. (Ôn Như Nguyễn Văn Ngọc)Truyện cổ nước Nam gồm hai quyển Người ta và Chim muông. Người ta kể những chuyện liên quan đến con người. Ảnh huwonrg của văn hóa Hán rất ít thấy bởi chúng được dẫn giải bằng tục ngữ, ca dao, lối ăn nói của người nông dân. Chim muông, với nhân vật là các loài vật, lại càng hồn nhiên dân dã, dễ đọc với bạn nhỏ, nhưng nhiều chuyện càng nghĩ càng thấy thâm thúy. (Nhà văn Trần Chiến)',N'assets/img/sach-thieu-nhi/truyen-co-nuoc-nam.jpg','03/11/2018',46,3,3)

--SÁCH GIÁO KHOA GIÁO TRÌNH
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Bài Giảng Và Lời Giải  Vật Lí 8',30780,N'Quyển sách được ra đời với mục tiêu:Hướng dẫn cho học sinh học tập các kiến thức trong Sách Giáo khoa,trả lời các câu hỏi, bài tập trắc nghiệm cũng như tự luận trong Sách giáo khoa cũng như sách bài tập để học sinh nắm vững kiến thức,từ đó phát huy tính tích cực,chủ động sáng tạo trong khi học tập và thực hành.Giúp học sinh củng cố,khắc sâu thêm những kiến thức và kĩ năng đã học trong chương trình chính khoá; có thể tự học, tự kiểm tra được kết quả học tập của bản thân',N'assets/img/giao-trinh-va-giao-khoa/bai-giang-va-loi-giai-chi-tiet-vat-ly-8.jpg','03/11/2018',50,1,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Bứt Phá Điểm Thi Môn Vật Lí',205128,N'Tập 1 gồm 3 chuyên đề: Dao động cơ; Sóng cơ và sóng âm; Dòng điện xoay chiều Tập 2 gồm 5 chuyên đề: Dao động và sóng điện từ; Sóng ánh sáng; Lượng tử ánh sáng;Hạt nhân nguyên tử; Thí nghiệm thực hành, tổng ôn kiến thức Vật lí 11. Mỗi chương chúng tôi chia ra thành các chủ đề và trong mỗi chủ đề đều được trình bày',N'assets/img/giao-trinh-va-giao-khoa/combo-but-pha-diem-thi.jpg','09/15/2017',80,8,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Cùng Khủng Long Học Toán',66880,N'Con hiểu bản chất từng bài Toán nhanh hơn thông qua hình ảnh và hoạt động đầy màu sắc Hình thành tư duy Toán Học - phát triển tư duy Toán Học cho trẻ tiểu học từ lớp 1 đến lớp 5. Hướng dẫn con tính toán đơn giản, logic với phương pháp mới lạ Con được thực hành với hàng trăm bài tập vận dụng nhanh, hướng dẫn giải cực chi tiết, dễ hiểu.Bộ sách Cùng Khủng Long Học Toán Siêu Đẳng bao gồm 18 cuốn từ lớp 1 đến lớp 5 được chia thành các chủ đề Toán Học: Chủ đề số học, chủ đề đại lượng đo, chủ đề hình học,... Mỗi chủ để được lồng ghép những kiến thức lý thuyết xen lẫn với hình ảnh minh họa phù hợp với độ tuổi của con.Cùng Khủng Long Học Toán Siêu Đẳng Chủ Đề Số Học Lớp 1 (Tập 2) xây dựng cho bé phản xạ tư duy Toán chủ đề Số học, đại lượng đo, bài toán có lời văn, hình học thông qua hình ảnh đầy màu sắc. Con sẽ được làm quen môn Toán với lộ trình với lộ trình 9 bài học: Đơn vị đo thời gian, bài toán có lời văn, sơ lược về hình vuông, hình chữ nhật,,... Con sẽ học được cách đọc, đếm, viết các số đến 100, nhận biết hàng chục, hàng đơn vị, tia số, các đơn vị đo,... dễ dàng nhất.',N'assets/img/giao-trinh-va-giao-khoa/cung-chu-khung-long-hoc-toan.jpg','11/11/2018',70,3,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Giáo Trình Chính Trị',29000,N'Giáo Trình Chính Trị',N'assets/img/giao-trinh-va-giao-khoa/giao-trinh-chinh-tri.jpg','06/07/2018',57,8,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Giáo Trình Triết Học',67080,N'Nội dung cuốn sách đề cập những vấn đề cơ bản nhất của bộ môn triết học, phù hợp với đối tượng giảng dạy là học viên cao học và nghiên cứu sinh không thuộc nhóm ngành khoa học xã hội và nhân văn: khái lược triết học và lịch sử triết học; những nội dung cơ bản của triết học Mác – Lênin; nguyên tắc thống nhất giữa lý luận và thực tiễn của triết học Mác – Lênin; lý luận hình thái kinh tế – xã hội và vận dụng vào sự nghiệp xây dựng chủ nghĩa xã hội ở Việt Nam; quan hệ giữa giai cấp, dân tộc, nhân loại trong thời đại ngày nay và vấn đề xây dựng nhà nước pháp quyền xã hội chủ nghĩa ở Việt Nam; quan điểm triết học Mác – Lênin về con người và vấn đề xây dựng con người Việt Nam hiện nay.',N'assets/img/giao-trinh-va-giao-khoa/giao-trinh-triet-hoc.jpg','03/11/2018',15,8,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Giáo Trình Tư Pháp Quốc Tế',109200, N'Là sự kết hợp giữa hình ảnh tươi sáng, cùng với những câu hỏi thú vị sẽ khuyến khích sự tương tác và hứng thú trong học tập. Cuốn sách giúp trẻ mở rộng vốn từ bằng những chủ đề đơn giản như màu sắc, loài vật, hình dạng và những con số.',N'assets/img/giao-trinh-va-giao-khoa/giao-trinh-tu-phap-quoc-te.jpg','03/11/2018',56,8,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Giáo Trình Tư Tưởng HCM',21600,N'Giáo Trình Tư Tưởng Hồ Chí Minh (2017)',N'assets/img/giao-trinh-va-giao-khoa/giao-trinh-tu-tuong-ho-chi-minh.jpg','03/11/2018',90,8,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Giúp Học Giỏi Hoá Học 12',47580,N'Nội dung cuốn sách đã được phân loại các dạng bài tập, giúp các em rèn luyện kĩ năng giải toán theo từng dạng nhằm khắc sâu kiến thức. Sau mỗi đề bài có lời giải chi tiết, rõ ràng nhằm giúp các em đối chiếu lại kết quả sau khi đã tự giải bài toán đó.Đồng thời,cuốn sách cũng đã được khai thác triệt để các dạng toán khác nhau về lí thuyết ucnxg như bài tập và có nhiều cách giải khác nhau nhằm làm phong phú kiến thức cho các em.Hi vọng cuốn sách sẽ là tài liệu tham khảo trợ giúp cho các đồng nghiệp trong quá trình giảng dạy.',N'assets/img/giao-trinh-va-giao-khoa/giup-hoc-gioi-hoa-hoc-lop-12.jpg','03/11/2018',150,1,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Kinh Tế Vi Mô',54400,N'Kinh Tế Vi Mô Chương 1: Những vấn đề cơ bản về kinh tế học Chương 2: Cầu cung và giá trị thị trường Chương 3: Độ co giãn của cung - cầu Chương 4: Can thiệp của chính phủ vào thị trường cạnh tranh Chương 5: Lựa chọn của người tiêu dùng và quyết định cầu Chương 6: Lý thuyết sản xuất và chi phí Chương 7: Thị trường cạnh tranh hoàn toàn Chương 8: Thị trường độc quyền hoàn toàn Chương 9: Thị trường cạnh tranh độc quyền và độc quyền nhóm Chương 10: Thị trường lao động',N'assets/img/giao-trinh-va-giao-khoa/kinh-te-vi-mo.jpg','03/11/2018',80,5,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Bài Văn Chọn Lọc Lớp 6',29240,N'Trong tập sách này, các em sẽ được tiếp xúc với các văn bản mẫu tương ứng với chương trình học tập gồm 3 phần:1.Các dạng bài Tự sự(Kể chuyện, kể chuyện đời thường, kể chuyện sáng tạo...)2.Các dạng bài Miêu tả(Tả thiên nhiên, cảnh sinh hoạt, tả người,...)3.Các dạng bài Rèn kĩ năng cảm thụ văn học.',N'assets/img/giao-trinh-va-giao-khoa/nhung-bai-van-chon-loc-lop-6.jpg','11/11/2018',60,1,4)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Thực Hành Giải Toán Lớp 2',53040,N'Sẽ giúp bố mẹ phá tan những lo lắng, trăn trở về vấn đề học Toán cho con với phương pháp học Toán dễ hiểu nhất giúp con thực hành, luyện tập hàng trăm bài toán, chinh phục mọi bài Toán tiểu học từ dễ đến khó.Con được thực hành, luyện tập hàng trăm bài Toán dễ khó. Giúp con hiểu bản chất từng bài Toán nhanh hơn thông qua hình ảnh, bài Toán gắn với thực tế.Hình thành tư duy Toán Học –phát triển tư duy Toán Học cho trẻ từ lớp 1 đến lớp 5Hướng dẫn con làm Toán với phương pháp học mới lạ thông qua hình ảnh.Con được thực hành với hàng trăm bài tập tính toán, vận dụng nhanh, hướng dẫn giải cực chi tiết, dễ hiểu.Con làm quen với các dạng bài tập: Đại lượng đo: Đề - xi – mét, mét, ki – lô – mét, mi – li – mét, hình chữ nhật, đường thẳng,….Xây dựng, định hướng phương pháp làm Toán thông qua những bài tập thực tế kèm hình ảnh minh họa.',N'assets/img/giao-trinh-va-giao-khoa/thuc-hanh-giai-toan-lop-2.jpg','03/11/2018',50,5,4)

--TẠP CHÍ-VĂN PHÒNG PHẨM
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Gia Định Báo',81900,N'Gia Định Báo - một hiện tượng văn hóa, văn học và ngôn ngữ bằng chữ Quốc ngữ đầu tiên. Nếu di sản văn hóa vật thể của Pháp (tạm gọi thế) như đường hỏa xa xuyên Việt đến nay còn khả dụng, thì Gia Định Báo - một di sản văn hóa phi vật thể - xuất hiện từ đầu thời Pháp thống trị cũng sẽ giúp ta hiểu được khúc quanh lịch sử của đất nước ta: từ phong kiến Á Đông chuyển sang chế độ thuộc địa nửa phong kiến, cụ thể là nước ta bị Pháp cai trị và bắt đầu sử dụng Quốc ngữ Latin đồng thời học tập theo khoa học thực nghiệm Tây phương.Ngày 15/4/1865, Gia Định Báo – tờ báo Việt ngữ đầu tiên chính thức ra mắt tại Sài Gòn. Khởi thủy là một tờ công báo tiếng Pháp của Soái phủ Nam kỳ (Courrier de Saigon, ấn hành năm 1864) dịch ra chữ Quốc ngữ, những ấn bản Gia Định Báo ban đầu có hình thức đơn giản, chỉ thuần thông tin công vụ, đăng tải công văn, nghị định của chính quyền thuộc địa. Tuy nhiên, trải qua 44 năm tồn tại (15/4/1865 – 31/12/1909), tờ công báo in bằng chữ Quốc ngữ này đã có những bước hoàn thiện, cách tân mạnh mẽ để trở thành một tờ báo thành một tờ báo đại chúng, phục vụ nhu cầu thông tin – giao tiếp, mở mang kiến thức – kỹ năng và thư giãn – giải trí cho người dân, đảm bảo cả hình thức lẫn nội dung thông tin, từ cách tổ chức đến vận hành tòa soạn, xứng đáng trở thành cột mốc đánh dấu sự ra đời của nền báo chí Việt Nam.',N'assets/img/tap-chi/gia-dinh-bao.jpg','03/11/2018',170,8,5)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Tạp Chí Bác Học Nhí',36000,N'Một mùa xuân mới lại về, xen giữa không khí hối hả của những ngày cuối năm là cảm giác vui tươi, hào hứng của mỗi em bé đón chờ cái Tết!Tết gắn liền với những bữa cơm quây quần đông đủ cả gia đình.Tết gắn liền với áo quần xúng xính. Tết gắn liền với những lời chúc năm mới hay ăn, chóng lớn, học giỏi, chăm ngoan…Nhưng bé có biết, Tết này còn có một điểm đặc biệt nữa? Đó là cái Tết gắn liền với các câu chuyện về những chú cún cưng, bởi 2018 theo Âm lịch là năm Mậu Tuất, do các chú chó nắm quyền hành khiển…Bác Học Nhí sẽ đem đến cho bé một vài chuyện hay về các chú chó quen thuộc đó nhé.',N'assets/img/tap-chi/tap-chi-bac-hoc-nhi.jpg','11/17/2018',50,3,5)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Tạp Chí Công Chúa',36000,N'Lại một mùa xuân sắp đến… Em đã cảm nhận được những âm thanh, hương thơm và mùi vị của Tết hay chưa?Đó là mùi của lá dong gói bánh chưng, mùi giò chả, mùi canh măng… đậm đà mâm cơm Tết. Đó còn là mùi nhang trầm nồng ấm, hương lá mùi già trong nồi nước tắm mẹ đun. Và hương hoa thơm ngát của mùa xuân, khi cây cối đâm chồi nảy lộc… Những mùi hương ấy khiến ai cũng thấy náo nức, rộn ràng, chờ mong ngày Tết cổ truyền.Năm 2018, tính theo Âm Lịch là năm Mậu Tuất – năm của Chó trong 12 con giáp.Chó là loài vật thông minh, có thính giác và khứu giác nhạy bén, lại cực kì trung thành nên sớm được con người thuần hóa để đi săn, canh gác… Dần dần, chó còn trở thành người bạn gắn bó, được yêu quý như người thân trong gia đình. Loài động vật tuyệt vời này sẽ mang đến cho em rất nhiều câu chuyện thú vị và bất ngờ trong số báo Tết mừng xuân 2018!Nào, ta cùng chào đón một năm mới, khởi đầu mới ngập tràn niềm vui và hứng khởi',N'assets/img/tap-chi/tap-chi-cong-chua.jpg','03/11/2018',70,3,5)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Tạp Chí Ô Tô',56140,N'Tết đã len lỏi đến từng ngõ ngách phố phường. Tết đã đến nhà cậu chưa? Cuốn lịch trong nhà chắc đã cần thay mới; tủ lạnh của mẹ có lẽ đang thèm được chất thêm những món ăn ngày Tết; bình hoa cũ trên bàn thờ hẳn cũng đang mong một cành mai, cành đào mới thật xinh; căn phòng khách hẳn cũng giục giã cậu lau dọn và gắn thêm vài món đồ trang trí mới. Mau hòa mình vào không khí Tết đi nào!Ô TÔ TẾT 2018 sẽ cùng cậu nhìn lại những sự kiện năm 2017 đã qua, theo từng cung bậc cảm xúc. Cậu sẽ được nghe kể những câu chuyện thú vị về ngày xưa.Rồi, ta cùng nhìn sang năm mới trước mắt, với biết bao điều mới mẻ và hấp dẫn trên khắp các lĩnh vực của cuộc sống.Tiễn Gà năm Dậu, năm nay ta đón chú Chó năm Tuất. Chú chó vốn là một hình ảnh rất quen thuộc, là người bạn đồng hành với con người lâu nay. Ấy thế mà có vô vàn chuyện lí thú xung quanh loài vật này mà hẳn cậu còn chưa biết hết. Ô TÔ Tết này sẽ cùng cậu khám phá!Đầu xuân năm mới, không thể thiếu những lời chúc và ước mong. Chúc cậu sang năm Mậu Tuất, làm việc gì cũng nhanh nhạy, tinh tường, học hành giỏi giang, chăm chỉ! Chúc cả nhà cậu mạnh khỏe, hạnh phúc, bình an.',N'assets/img/tap-chi/tap-chi-oto.jpg','03/11/2018',250,9,5)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Trà Sữa Cho Tâm Hồn',26580,N'Trà Sữa Cho Tâm Hồn 145 phát hành ngày 11/10/2017 đánh dấu sự trở lại của các cây bút được độc giả yêu thích như Hi Trần, Ren, Hiền Trang, Hiro…99 bông hồng và 1000 chiếc lá là một truyện ngắn hết sức ngọt ngào mà Trà Sữa khuyến cáo bạn đọc ngay khi cầm trên tay ấn phẩm mới tinh Trà Sữa Cho Tâm Hồn 145. Khởi đầu từ một tai nạn hết sức oái oăm khi quả bóng rổ từ trên trời rơi xuống một cô nàng đang mê mải đọc sách, dẫn đến cuộc đấu khẩu khiến anh chàng gây ra tai nạn phải bồi thường tới… ba nắm cơm rong biển.Dần dà tình cảm chớm nở nơi họ, nhưng mười bảy tuổi, cô còn quá trẻ để hiểu thấu bản thân, cậu cũng chưa đủ trưởng thành để bao dung kẻ khác. Mười tám tuổi, dẫu còn bao nhiêu liều lĩnh và mạo hiểm, nhưng nếu đã lỡ phải lòng nhau rồi thì hãy thử can đảm một lần nắm tay. Không thử thì mãi mãi chẳng biết ấm áp và chân thành có màu xanh của lá…Lời văn dễ thương và cũng đầy dịu dàng của 99 bông hồng và 1000 chiếc lá chắc chắn sẽ làm độc giả của Trà Sữa thích thú cho tới tận dòng cuối cùng.',N'assets/img/tap-chi/tra-sua-cho-tam-hon.jpg','11/19/2018',250,6,5)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Viết Báo Dễ Hay Khó',50700,N'Làm phóng viên là một công việc thật thú vị, được đi đây đi đó, hàng ngày được gặp gỡ với nhiều người, và có lúc là những người rất nổi tiếng. Làm phóng viên bạn sẽ được tiếp cận với những tin tức nóng hổi, được viết cho cả hàng triệu người đọc được ký tên của mình dưới mỗi bài báo, được độc giả yêu mến, biết tên... Và bao nhiêu là điều thú vị khác nữa, thậm chí là tự hào khi nghề của bạn là niềm mơ ước của hàng triệu bạn trẻ khác.Nhưng là một phóng viên trẻ mới vào nghề, bạn sẽ luôn vấp phải những vấn đề không dễ giải quyết: Bạn luôn phải đối mặt với những thứ chán ngắt như báo cáo tổng kết, hội nghị, hội thảo, khởi công, khánh thành... làm thế nào để tránh được những tin nhạt nhẽo và nhàm chán? Tại sao bạn viết bài rất dài nhưng vẫn thấy chưa hết ý mà lại bị sếp chê là tham lam và thẳng tay cắt bỏ không thương tiếc? Đôi khi bạn rất hào hứng với một chủ đề nào đó, trong đầu nảy ra bao nhiêu ý tứ cho bài viết nhưng khi đặt bút thì ý tưởng tự nhiên bay đi đâu hết? Hay chuyện tưởng như đơn giản là đặt một cái tít cho bài báo đầy tâm huyết cũng có khi khiến bạn phải vò đầu bứt tai. Bạn chắc hẳn không ít lần bối rối nhìn ánh mắt của sếp lướt qua bài báo bạn vừa nộp và buông câu nhận xét lạnh lùng Tít chung chung, nhạt nhẽo thế này thì ai đọc báo đây...',N'assets/img/tap-chi/viet-bao-de-hay-kho.jpg','03/11/2018',80,8,5)

--SÁCH VĂN HỌC
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Ân Sủng Của Đời',71400,N'Daniel Glattauer tiếp tục gây ấn tượng với lối viết vừa hài hước vừa ý nhị, duyên dáng. Câu chuyện vô cùng dí dỏm xoay quanh Geri, một nhà báo hạng... Z bỗng chốc bị cuốn vào cuộc điều tra những món tiền từ thiện bí ẩn cùng cậu con rơi vô cùng cá tính. Thông qua câu chuyện, tác giả viết về tình cảm cha - con, thể hiện trách nhiệm của Geri với cậu con trai 14 tuổi của mình, cũng như bàn về vai trò của người làm báo trong thế giới đương đại vô vàn áp lực. Mượn góc nhìn của Geri, những vấn đề xã hội như: nhập cư trái phép, tị nạn, thất nghiệp, đói nghèo... được tác giả đề cập tới bằng ngòi bút gây cười, cái cười giúp người ta hiểu có thể tiếp cận những vấn đề nóng trong xã hội theo nhiều cách khác nhau.',N'assets/img/sach-van-hoc/an-sung-cua-doi.jpg','03/11/2018',50,2,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Dáng Hồn Đô Thị',51750,N'Kiến trúc sư viết tùy bút thì sao nhỉ? Vẫn hay, vẫn hấp dẫn, vẫn đầy chất thơ và chất nhạc đấy, chứ không chỉ là những hình khối, những số liệu khô khan. Thừa hưởng tâm hồn thi sĩ từ người cha, nhà thơ Lưu Trọng Lư, giọng văn của tác giả không trau chuốt nhưng vẫn mượt mà dễ đọc, dễ cảm.DÁNG HỒN ĐÔ THỊ là một tác phẩm mới nhất của kiến trúc sư Lưu Trọng Hải. Sau nhiều năm sinh sống và phát triển sự nghiệp của mình, chính tại nơi mà ông lớn lên, ông đã viết một tác phẩm để đời nói tóm tắt về cuộc sống nơi đô thị, một thành phố phát triển.DÁNG HỒN ĐÔ THỊ là một tác phẩm thực tế về cuộc sống xã hội, đang diễn ra trước mắt, cuốn sách tập hợp đa dạng những mảng hồi kí, những câu chuyện đời thường trong cuộc sống mà hằng ngày thỉnh thoảng ở đâu đó ta bắt gặp ngoài đường, chẳng hạn như sài gòn bất chợt, những cơn nắng, cơn mưa hay tô phở thơm phức làm người ta muốn thưởng thức chúng ngay lập tức. Tất tần tật những câu chuyện nhỏ, những gì diễn ra trước mắt mà tác giả nhìn thấy đều đã được ông quay lại một cách chi tiết, với một ánh mắt long lanh tỏa sáng, và một bộ nhớ phi thường một cách cụ thể, chi tiết đến nỗi mà chúng ta khó có thể hình dung đó là sự thật sao.',N'assets/img/sach-van-hoc/dang-hon-do-thi.jpg','03/11/2018',50,6,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Đỗ Thích Kỳ Án',90000,N'Đỗ Thích Kỳ Án',N'assets/img/sach-van-hoc/do-thich-ky-an.jpg','03/11/2018',40,9,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Mỗi Người Một Chỗ Ngồi',45500,N'Tình yêu, những mối quan hệ gia đình, quan niệm sống, cách hành xử trước những biến động trong đời sống hiện đại… bạn sẽ gặp ở  Mỗi Người Một Chỗ Ngồi .Cuộc sống với những điều kiện, đòi hỏi ngày càng khắc nghiệt đôi khi khiến con người phải sống vội vã, hời hợt, tất yếu sẽ dẫn đến rạn nứt, đổ vỡ những mối quan hệ tưởng như bền chặt. Người ta cũng có thể đánh mất nhau khi chưa kịp hiểu vì sao, hoặc mới chỉ mang máng nhận ra những lý do hết sức mơ hồ, hoặc thấy rõ là tình yêu phai nhạt. Tự xác định cho mình một chỗ đứng, tự khẳng định những khả năng của mình vừa là nhu cầu, vừa là điều kiện để cho mình được là chính mình. Và sự lệ thuộc vào người khác có khi lại là cái giá phải trả cho những bon chen thực dụng ...Phan Triều Hải chặt chẽ trong những dẫn dắt câu chuyện tưởng như lan man, dàn trải. Nhịp điệu chậm rãi, vẻ bàng bạc trong câu chữ luôn ẩn chứa sự tinh tế, từng trải của người trong cuộc. Ngòi bút sắc của anh chỉ phơi bày, không trực diện bình phẩm hay phê phán, những chi tiết nhạy cảm nhất trong đời sống tinh thần của con người. Với những bạn đọc quen sốt ruột đuổi theo tình tiết câu chuyện, hay chờ nghe sự phán xét của tác giả, thì sẽ không bao giờ nhận ra được đấy chính là phẩm chất của văn chương đích thực. (Trần Đức Tiến)',N'assets/img/sach-van-hoc/moi-nguoi-mot-cho-ngoi.jpg','03/11/2018',60,6,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Nhà Thờ Đức Bà Paris',85050,N'Nhà văn Eugène Sue nhận xét: … Ngoài chất thơ cùng tất cả sự phong phú của tư tưởng và tính kịch, tôi xin nói thêm cuốn truyện của ông còn có gì đó làm tôi vô cùng xúc động. Có thể nói Quasimodo tiêu biểu cho vẻ đẹp tâm hồn và sự tận tụy, Froll tiêu biểu cho sự uyên bác, trí thức khoa học, khả năng trí tuệ, còn Chateaupers tuyệt diệu để ba nhân vật điển hình đó, cùng một thực chất như chúng ta, đối mặt với một cô gái ngây thơ, gần như man dại giữa nền văn minh, trao cho cô ta quyền được lựa chọn và để cô ta lựa chọn một cách hết sức đàn bà.Nhà sử học Jules Michelet nhận xét: Cạnh ngôi nhà thờ lớn cổ kính, Victor Hugo xây dựng một tòa nhà thờ lớn khác bằng thi ca, cũng ngất cao như dãy tháp của tòa nhà thờ nọ.',N'assets/img/sach-van-hoc/nha-tho-duc-ba-paris.jpg','11/15/2018',90,6,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Những Cánh Hoa Tàn',33750,N'Những Cánh Hoa TànNam Cao có bút danh là Thúy Rư, Xuân Du, Nguyệt, Nhiêu Khê...Tên khai sinh: Trần Hữu Tri, sinh ngày 29 tháng 10 năm 1917. Quê quán: làng Đại Hoàng, phủ Lý Nhân, tỉnh Hà Nam (nay là xã Hòa Hậu, huyện Lý Nhân, Hà Nam).Một số tác phẩm tiêu biểu: Đôi lứa xứng đôi (tập truyện ngắn - 1941),Nửa đêm (tập truyện ngắn - 1943), Đôi mắt (tập truyện ngắn - 1954), Sống mòn (tiểu thuyết - 1956)',N'assets/img/sach-van-hoc/nhung-canh-hoa-tan.jpg','03/11/2018',80,2,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Những Người Khốn Khổ',234000,N'Trong tác phẩm Những người khốn khổ, cuộc sống cao đẹp của Giăngvăngiăng - người phải ngồi tù suốt 19 năm chỉ vì một chiếc bánh mỳ, tình nhân ái bao dung và tấm lòng độ lượng của đức cha Mirien, sự đeo bám dai dẳng của mật thám Giave, những mưu đồ đen tối và độc ác của vợ chồng Tênácđiê, sự ngây thơ trong trắng của Côdét, sự nhiệt tình hăng hái của Mariuýt... Tất cả đều được khắc họa một cách sinh động.Những người khốn khổ là bài hát ca ngợi tình yêu và tự do của Giăngvăngiăng -một con người tái sinh trong đau khổ và tuyệt vọng.',N'assets/img/sach-van-hoc/nhung-nguoi-khon-kho.jpg','03/11/2018',90,9,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Sài Gòn Bao Nhớ',48000,N'Bạn có thể nhớ về cha mẹ như về những người đã đánh đòn bạn, họ già cả và trái tính trái nết, đôi lúc khó khăn đến khắc nghiệt... và bạn cũng có thể nhớ về cha mẹ như những người gần như duy nhất trên hành tinh này đã luôn yêu thương, chăm sóc và hy sinh tất cả cho bạn, vô điều kiện. Bạn có thể nhớ về Sài Gòn như về một chốn xô bồ, đầy kẹt xe, bụi bặm, cướp giật, xì ke và lừa lọc... hoặc bạn cũng có thể chọn nhớ về Sài Gòn như về mảnh đất đã cưu mang mười triệu con người, mảnh đất của tình nghĩa, phóng khoáng và hào hiệp.Bạn được quyền lựa chọn ký ức đẹp.Ít có thành phố nào mà những con người từ nơi khác đến, ở lại và chọn làm quê hương, đều viết về nó bằng những lời đầy yêu thương như vậy. Sài Gòn, đặc tính Sài Gòn, cốt cách Sài Gòn, liệu có bao giờ người ta nói được hết về nó chăng?.. ',N'assets/img/sach-van-hoc/sai-gon-bao-nho.jpg','03/11/2018',40,6,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Tắt Đèn',17380,N'Tác phẩm của nhà văn Ngô Tất Tố đã được trích giảng trong nhà trường phổ thông. Tiểu thuyết kể về cuộc đời cực nhục của chị Dậu, vì sưu thuế phái bán con và ổ chó nhưng cũng không cứu được chồng. Cuối cùng chị phải chạy đi trong đêm đen như mực.',N'assets/img/sach-van-hoc/tat-den.jpg','03/11/2018',150,5,6)
insert into [dbo].[SACH]([TenSach],[GiaBan],[MoTa],[AnhBia],[NgayCapNhat],[SoLuongTon],[MaNXB],[MaChuDe]) 
values(N'Vẩn Vơ Nơi Ga Xép',54000,N'Tập sách gồm những bài tạp bút tản mạn về cuộc sống, về những ký ức tuổi thơ,... đã đăng trên mục Trà dư Tửu hậu của Thời báo kinh tế Sài Gòn từ nhiều năm qua.',N'assets/img/sach-van-hoc/van-vo-noi-ga-xep.jpg','03/11/2018',80,5,5)

--TABLE KHÁCH HÀNG
--Kiểm tra thông tin đăng nhập
alter proc kt_login
@username nvarchar(50),
@pass nvarchar(50)
as
select *from [dbo].[KhachHang] where [HoTen]=@username and [MatKhau]=@pass

exec kt_login 'HieuNguyen', '12345'
--Thêm mới khách hàng
create proc insert_Login
@hoTen nvarchar(50),
@email nvarchar(100),
@pass nvarchar(50),
@ns datetime
as
insert into [dbo].[KhachHang]([HoTen],[Email],[MatKhau],[NgaySinh]) values(@hoTen,@email,@pass,@ns)

--BẢNG SÁCH
--Lấy toàn bộ thông tin sách
create proc sachSelectAll
as
select * from [dbo].[SACH]

exec sachSelectAll

--Lấy sách theo mã sách
create proc selectSachByMaSach
@masach int
as
select * from SACH where MaSach=@masach
 
 exec selectSachByMaSach 157
--Lấy toàn bộ sách theo chủ đề
create proc selectSachByChuDe
@chude int
as
select *from SACH where MaChuDe=@chude

--BẢNG CHỦ ĐỀ
--Lấy toàn bộ thông tin chủ đề
create proc selectAllChuDe
as
select * from [dbo].[ChuDe]

--Test 
exec selectAllChuDe

--BẢNG ĐƠN HÀNG
--Thêm đơn hàng
alter table  [dbo].[DonHang] add TongTien float
create proc insertDonHang
@thanhToan int,
@tinhTrang int,
@ngayDat datetime,
@ngayGiao datetime,
@maKH int,
@tongTien float
as
insert into [dbo].[DonHang]([DaThanhToan],[TinhTrangGiaoHang],[NgayDat],[NgayGia],[MaKhachHang],[TongTien])
values(@thanhToan,@tinhTrang,@ngayDat,@ngayGiao,@maKH,@tongTien)

--Lấy mã hóa đơn mới nhất
create proc getDonHangByIdMax
as
select MAX(MaDonhang) from [dbo].[DonHang]


--BẢNG CHI TIẾT HÓA ĐƠN
--Thêm mới chi tiết hóa đơn
create proc createCTDH
@MaDH int,
@ms int,
@soluong int,
@dongia float
as
insert into [dbo].[ChiTietDonHang] values(@MaDH,@ms,@soluong,@dongia)


-- dang ki ----
alter proc dangki 
@HoTen nvarchar(50), 
@Email nvarchar(100), 
@MatKhau nvarchar(50),
@NgaySinh datetime 
as 
begin 
declare @check int 
set @check = (select COUNT(*) from KhachHang where Email = @Email) 
if @check = 0
begin 
insert into [dbo].[KhachHang](HoTen,Email,MatKhau,NgaySinh) values(@Hoten,@Email,@MatKhau,@NgaySinh)
select @@ROWCOUNT 
end
else 
begin
select -1
end 
end 


exec dangki N'nguyễn tuấn tai ' , 'tuananh123@gmail.com','123456','1997-05-11'
---- dang ki tra ve 0 , 1 de biet da them tk chua -----

select * from KhachHang