package Parse;

public enum TypeRegular {
    EMAIL("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$"), NUMBER("[\\d]+"), DATE(
            "(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/((19|20)\\d\\d)"), FLOAT(
            "[-+]?[0-9]*\\.?[0-9]+"), PHONE("[\\d]{10,11}"), IMAGE(
            "([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)"), SPECIALCHAR("[A-Za-z0-9]+")
            ,VN("^[a-zA-Záàảãạẳăắằặâấầẩẫậéèẹẻìịíĩỉêếềệểễđóòỏõọơớờợởỡôộỗổồốỷýỹỵỳúùụủũưứừữửự"
                    + "ÁÀẢÃẠẮĂẰẲẴẶÂẤẦẨẪẬÉÈẺẼẸÍÌỈĨỊÊẾỀỂỄỆĐÓÒỎÕỌƠỚỜỢỞỠÔỐỒỔỖÝỲỶỸỴÚÙỤ"
                    + "ỦŨƯỪỨỮỬỰ\\s\\d]+");

    private String value;

    /**
     * @return
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value
     */
    private TypeRegular(String value) {
        this.value = value;
    }
}
