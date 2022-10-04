<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
		bmiForm.jsp, bmiResult.jsp
		
		사용자로부터 이름, 키, 체중 값을 입력 받아 비만도를 구하고 
		결과를 출력 할 때 비만도 값 100을 기준으로 100 미만이면 저체중, 
		100 이상 110 미만은 정상, 110 이상 120 미만 과체중, 120 이상 130 미만 비만, 
		130 이상은 고도비만으로 출력 하시오.
		
		비만도 계산 식 : 비만도(%) = 현재 체중 / 표준 체중 * 100
		표준 체중 계산 식 : 표준 체중 = (현재 키 – 100) * 0.9

		출력 예제 : 홍길동님의 비만도는 112.15% 로 과체중 입니다.
--%>
<%!
	double bmi(double height, double weight){
		double std = (height - 100) * 0.9;
		double bmiData = weight / std * 100;
		return bmiData;
	}

	String bmiMessage(double bmiData){
		String message = "";
		
		if(bmiData > 130)
			message = "고도비만";
		else if(bmiData > 120)
			message = "비만";
		else if(bmiData > 110)
			message = "과체중";
		else if(bmiData > 100)
			message = "정상";
		else 
			message = "저체중";
		
		return message;
	}
%>
<%	
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String he = request.getParameter("height");
	String we = request.getParameter("weight");
	
	double height = 0, weight = 0;
	
 	try{ // 예외가 발생 할 수 있는 코드
		height = Double.parseDouble(he);
		weight = Double.parseDouble(we);
	}catch(Exception e){
		// 예외가 발생을 하면 실행할 코드
	} 
	
	double bmiData = bmi(height, weight);
	String bmiMsg = bmiMessage(bmiData);
	out.print(name + "님의 비만도는 " + String.format("%.2f",  bmiData) + "%로 " + bmiMsg + "입니다.");	
%>

