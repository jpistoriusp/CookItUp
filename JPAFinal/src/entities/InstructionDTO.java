package entities;

public class InstructionDTO {

	private int stepNumber;
	private String text;
	
	
	public int getStepNumber() {
		return stepNumber;
	}
	public void setStepNumber(int stepNumber) {
		this.stepNumber = stepNumber;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "InstructionDTO [stepNumber=" + stepNumber + ", text=" + text + "]";
	}
	
	
}
