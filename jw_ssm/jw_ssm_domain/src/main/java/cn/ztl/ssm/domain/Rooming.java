package cn.ztl.ssm.domain;

public class Rooming {
    private Integer S_roomOfNumber;
    private Integer numberOfPeople; // 宿舍人数
    private Integer waterOfFee;       //水费
    private Integer electricOfFee;     //电费
    private String errorOfAppliance; //错误报告

    @Override
    public String toString() {
        return "Rooming{" +
                "S_roomOfNumber=" + S_roomOfNumber +
                ", numberOfPeople=" + numberOfPeople +
                ", waterOfFee=" + waterOfFee +
                ", electricOfFee=" + electricOfFee +
                ", errorOfAppliance='" + errorOfAppliance + '\'' +
                '}';
    }

    public Integer getS_roomOfNumber() {
        return S_roomOfNumber;
    }

    public void setS_roomOfNumber(Integer s_roomOfNumber) {
        S_roomOfNumber = s_roomOfNumber;
    }

    public Integer getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(Integer numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public Integer getWaterOfFee() {
        return waterOfFee;
    }

    public void setWaterOfFee(Integer waterOfFee) {
        this.waterOfFee = waterOfFee;
    }

    public Integer getElectricOfFee() {
        return electricOfFee;
    }

    public void setElectricOfFee(Integer electricOfFee) {
        this.electricOfFee = electricOfFee;
    }

    public String getErrorOfAppliance() {
        return errorOfAppliance;
    }

    public void setErrorOfAppliance(String errorOfAppliance) {
        this.errorOfAppliance = errorOfAppliance;
    }
}
