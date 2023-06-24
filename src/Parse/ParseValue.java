package Parse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import model.dao.*;

public class ParseValue {

    private DAO base;

    private Pattern pattern;
    private Matcher matcher;
    private String strFormatDate = "yyyy-mm-dd";
    private SimpleDateFormat simpleDateFormat;

    public ParseValue() {
        base = new DAO();
        simpleDateFormat = new SimpleDateFormat(strFormatDate);
        simpleDateFormat.setLenient(false);
    }

    // ----------------Các hàm kiểm tra dữ liệu-----------------------------

    public boolean checkExist(String table, String columnName, String id) {
        if (base.checkExist(table, columnName.trim() + "=N'" + id.trim() + "'"))
            return true;
        return false;
    }

    public boolean checkEmail(String email) {
        if (validate(email, TypeRegular.EMAIL))
            return true;
        return false;
    }

    public boolean checkPhone(String phone) {
        if (validate(phone, TypeRegular.PHONE))
            return true;
        return false;
    }

    public boolean checkNumber(String number) {
        if (validate(number, TypeRegular.NUMBER))
            return true;
        return false;
    }

    public boolean checkImage(String link) {
        if (validate(link, TypeRegular.IMAGE))
            return true;
        return false;
    }

    public boolean checkEmpty(String value) {
        if ("".equals(value.trim()) || value == null) {
            return true;
        }
        return false;
    }

    public boolean checkLength(String value, int maxLength) {
        if (value.trim().length() > maxLength) {
            return false;
        }
        return true;
    }
    
    public boolean checkLength(String value, int minLength, int maxLength) {
        if (value.trim().length() > maxLength || value.trim().length() < minLength) {
            return false;
        }
        return true;
    }

    public boolean checkVN(String value) {
        if (validate(value, TypeRegular.VN))
            return true;
        return false;
    }

    public boolean validate(String value, TypeRegular reg) {
        pattern = Pattern.compile(reg.getValue(), Pattern.CASE_INSENSITIVE);
        matcher = pattern.matcher(value);
        return matcher.matches();
    }

    public boolean checkDate(String value) {
        boolean test = true;
        try {
            @SuppressWarnings("unused")
            Date date = simpleDateFormat.parse(value);
        } catch (ParseException e) {
            test = false;
        }
        return test;
    }

    public static String convertDateDDMMYY(String value) {
        try {
            Date x = new SimpleDateFormat("yyyy-MM-dd").parse(value);
            return new SimpleDateFormat("dd-MM-yyyy").format(x);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "";
    }

    public boolean checkNotSpecialChar(String userName) {
        if (validate(userName, TypeRegular.SPECIALCHAR)) {
            return true;
        } else {
            return false;
        }
    }

    public static String getTimeNow() {
        Date now = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return format.format(now);
    }
}
