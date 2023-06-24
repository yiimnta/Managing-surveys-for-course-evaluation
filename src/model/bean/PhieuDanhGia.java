package model.bean;

import java.sql.*;
import java.util.*;

public class PhieuDanhGia extends BaseBean {
    private String maDG;
    private String tieuDe;
    private String maGD;
    private String maGV;
    private String maKhoa;
    private String thoiGianDang;
    private String trangThai;
    private String loaiP;
    private String maNguoiTao;
    private String nienKhoa;
    private String hocKy;
    @SuppressWarnings("unused")
    private String soLanDG;
    private String flag = "0";
    private GiangDay giangDay;
    private GiangVien giangVien;
    private NguoiDung nguoiDung;
    private LoaiPhieu loaiPhieu;
    private Khoa khoaHoc;
    private ArrayList<KetQua> listKetQua = new ArrayList<KetQua>();
    private ArrayList<NoiDung> listNoiDung = new ArrayList<NoiDung>();

    public String getMaDG() {
        return maDG;
    }

    public void setMaDG(String maDG) {
        this.maDG = maDG;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getMaGD() {
        return maGD;
    }

    public void setMaGD(String maGD) {
        this.maGD = maGD;
    }

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }

    public String getThoiGianDang() {
        return thoiGianDang;
    }

    public void setThoiGianDang(String thoiGianDang) {
        this.thoiGianDang = thoiGianDang;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getLoaiP() {
        return loaiP;
    }

    public void setLoaiP(String loaiP) {
        this.loaiP = loaiP;
    }

    public String getMaNguoiTao() {
        return maNguoiTao;
    }

    public void setMaNguoiTao(String maNguoiTao) {
        this.maNguoiTao = maNguoiTao;
    }

    public String getNienKhoa() {
        return nienKhoa;
    }

    public void setNienKhoa(String nienKhoa) {
        this.nienKhoa = nienKhoa;
    }

    public String getHocKy() {
        return hocKy;
    }

    public void setHocKy(String hocKy) {
        this.hocKy = hocKy;
    }

    public GiangDay getGiangDay() {
        return giangDay;
    }

    public void setGiangDay(GiangDay giangDay) {
        this.giangDay = giangDay;
    }

    public GiangVien getGiangVien() {
        return giangVien;
    }

    public void setGiangVien(GiangVien giangVien) {
        this.giangVien = giangVien;
    }

    public Khoa getKhoaHoc() {
        return khoaHoc;
    }

    public void setKhoaHoc(Khoa khoaHoc) {
        this.khoaHoc = khoaHoc;
    }

    public LoaiPhieu getLoaiPhieu() {
        return loaiPhieu;
    }

    public void setLoaiPhieu(LoaiPhieu loaiPhieu) {
        this.loaiPhieu = loaiPhieu;
    }

    public ArrayList<KetQua> getListKetQua() {
        return listKetQua;
    }

    public void setListKetQua(ArrayList<KetQua> listKetQua) {
        this.listKetQua = listKetQua;
    }

    public ArrayList<NoiDung> getListNoiDung() {
        return listNoiDung;
    }

    public void setListNoiDung(ArrayList<NoiDung> listNoiDung) {
        this.listNoiDung = listNoiDung;
    }

    public PhieuDanhGia() {
    }

    public PhieuDanhGia(String tieuDe, String maGD, String maGV, String maKhoa,
            String thoiGianDang, String trangThai, String loaiP,
            String maNguoiTao, String nienKhoa, String hocKy) {
        this.tieuDe = tieuDe;
        this.maGD = maGD;
        this.maGV = maGV;
        this.maKhoa = maKhoa;
        this.thoiGianDang = thoiGianDang;
        this.trangThai = trangThai;
        this.loaiP = loaiP;
        this.maNguoiTao = maNguoiTao;
        this.nienKhoa = nienKhoa;
        this.hocKy = hocKy;
    }

    public PhieuDanhGia(String maDG, String tieuDe, String maGD, String maGV,
            String maKhoa, String thoiGianDang, String trangThai, String loaiP,
            String maNguoiTao, String nienKhoa, String hocKy) {
        this.maDG = maDG;
        this.tieuDe = tieuDe;
        this.maGD = maGD;
        this.maGV = maGV;
        this.maKhoa = maKhoa;
        this.thoiGianDang = thoiGianDang;
        this.trangThai = trangThai;
        this.loaiP = loaiP;
        this.maNguoiTao = maNguoiTao;
        this.nienKhoa = nienKhoa;
        this.hocKy = hocKy;
    }

    @SuppressWarnings("unchecked")
    public PhieuDanhGia convert(ResultSet rs) {
        try {
            String maDGo = rs.getString("MaDG") == null ? "" : rs
                    .getString("MaDG");
            String tieuDeo = rs.getString("TieuDe") == null ? "" : rs
                    .getString("TieuDe");
            String maGDo = rs.getString("MaGD") == null ? "" : rs
                    .getString("MaGD");
            String maGVo = rs.getString("MaGV") == null ? "" : rs
                    .getString("MaGV");
            String maKhoao = rs.getString("MaKhoa") == null ? "" : rs
                    .getString("MaKhoa");
            String thoiGianDango = rs.getString("ThoiGianDang") == null ? ""
                    : rs.getString("ThoiGianDang");
            String trangThaio = rs.getString("TrangThai") == null ? "" : rs
                    .getString("TrangThai");
            String loaiPo = rs.getString("LoaiP") == null ? "" : rs
                    .getString("LoaiP");
            String maNguoiTaoo = rs.getString("MaNguoiTao") == null ? "" : rs
                    .getString("MaNguoiTao");
            String nienKhoao = rs.getString("NienKhoa") == null ? "" : rs
                    .getString("NienKhoa");
            String hocKyo = rs.getString("HocKy") == null ? "" : rs
                    .getString("HocKy");
            return new PhieuDanhGia(maDGo, tieuDeo, maGDo, maGVo, maKhoao,
                    thoiGianDango, trangThaio, loaiPo, maNguoiTaoo, nienKhoao,
                    hocKyo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getArgsAdd() {
        addValue(tieuDe);
        addValue(maGD);
        addValue(maGV);
        addValue(maKhoa);
        addValue(thoiGianDang);
        addValue(trangThai);
        addValue(loaiP);
        addValue(maNguoiTao);
        addValue(nienKhoa);
        addValue(hocKy);
        return toStringArgs();
    }

    @Override
    public String getCondition() {
        addCondition("MaDG", maDG);
        return toStringCondition();
    }

    public String getArgsUpdate() {
        addValue("TieuDe", tieuDe);
        addValue("MaGD", maGD);
        addValue("MaGV", maGV);
        addValue("MaKhoa", maKhoa);
        addValue("ThoiGianDang", thoiGianDang);
        addValue("TrangThai", trangThai);
        addValue("LoaiP", loaiP);
        addValue("MaNguoiTao", maNguoiTao);
        addValue("NienKhoa", nienKhoa);
        addValue("HocKy", hocKy);
        return toStringArgs();
    }

    public void includeGiangDay(ArrayList<GiangDay> giangDayl) {
        for (GiangDay ob : giangDayl) {
            if (getMaGD().equals(ob.getMaGD())) {
                setGiangDay(ob);
                break;
            }
        }
    }

    public void includeGiangVien(ArrayList<GiangVien> giangVienl) {
        for (GiangVien ob : giangVienl) {
            if (getMaGV().equals(ob.getMaGV())) {
                setGiangVien(ob);
                break;
            }
        }
    }

    public void includeKhoaHoc(ArrayList<Khoa> khoaHocl) {
        for (Khoa ob : khoaHocl) {
            if (getMaKhoa().equals(ob.getMaKhoa())) {
                setKhoaHoc(ob);
                break;
            }
        }
    }

    public void includeLoaiPhieu(ArrayList<LoaiPhieu> loaiPhieul) {
        for (LoaiPhieu ob : loaiPhieul) {
            if (getLoaiP().equals(ob.getLoaiP())) {
                setLoaiPhieu(ob);
                break;
            }
        }
    }

    public void includeKetQua(ArrayList<KetQua> ketQual) {
        for (KetQua ob : ketQual) {
            if (getMaDG().equals(ob.getMaDG())) {
                getListKetQua().add(ob);
            }
        }
    }

    public void includeNoiDung(ArrayList<NoiDung> noiDungl) {
        for (NoiDung ob : noiDungl) {
            if (getMaDG().equals(ob.getMaDG())) {
                getListNoiDung().add(ob);
            }
        }
    }

    public String getSoLanDG() {
        return "" + listKetQua.size();
    }

    public void setSoLanDG(String soLanDG) {
        this.soLanDG = soLanDG;
    }

    public void includeNguoiDung(ArrayList<NguoiDung> nguoiDungl) {
        for (NguoiDung ob : nguoiDungl) {
            if (getMaNguoiTao().equals(ob.getMaND())) {
                setNguoiDung(ob);
                break;
            }
        }
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
