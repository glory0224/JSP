<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	response.setCharacterEncoding("utf-8");	
    
    	String fileName = request.getParameter("fileName");
    	String writeId = request.getParameter("writeId");
    	
    	// 파일이 없는 경우 체크
    	// 파라미터 자체가 넘어오지 않는 경우 null 체크 
    	if(fileName == null || writeId == null){
    		// redirect가 null인 경우 확인용 출력
    		System.out.println("fileName null: " + fileName);
    		System.out.println("wirteId null: " + writeId);    		
    		response.sendRedirect("boardForm.jsp");
    		return;
    	}
    	
    	// 파일 이름이 비어있거나 작성자의 id가 없는 경우 체크 
    	if(fileName == "" || writeId == ""){
    		// redirect가 empty인 경우 확인용 출력
    		System.out.println("fileName empty: " + fileName);
    		System.out.println("wirteId empty: " + writeId);
    		response.sendRedirect("boardForm.jsp");
    		return;
    	}
    	
    	// 저장경로 설정
    	String saveDir = "C:\\jsps\\upload\\" + writeId + "\\" + fileName;
    	
    	File file = new File(saveDir);
    	
    	//저장된 파일을 읽기 위해서 InputStream으로 가져온다.
    	FileInputStream iStream = new  FileInputStream(file);
    	
    	/*
    	out 내장객체가 사용 중 이기에 getOutputStream() 이미 호출되었다는 에러 발생 ↓ 	 
    	java.lang.IllegalStateException: 이 응답을 위해 getOutputStream()이 이미 호출되었습니다.
    	이미 열려있어서 나는 에러이기때문에 out.clear(); -> buffer를 지워주고 out 내장객체에 다시 getOutputStream을 사용할 수 있도록 넣어준다.
    	*/
    	out.clear(); // 사용 중인 Buffer 초기화 
    	out = pageContext.pushBody(); // out 내장객체는 전역적으로 사용가능한 OutputStream이 아니라 현재 페이지의 Body만 출력할 OutputStream 객체를 넣어준다. 
    	
    	// 프로그램의 데이터를 변수에 담아서 클라이언트에게 전달
    	OutputStream oStream = response.getOutputStream(); // out이라는 내장객체가 이미 getOutputStream()를 쓰고 있어서 out으로 지워주고 다시 전역적으로 사용할 수 있도록 한다.
    	
    	/* 
    		파일 데이터인지 화면에 출력할 문자열 데이터인지 구분하기 위한 HTTP 안에 Header의 속성과 값을 설정한다.
    		
    	*/
    	// 파일 타입 명시 
    	response.setContentType("application/octet-stream");
    	// 파일 구분을 위한 헤더 설정
    	response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
    	
    	/* 
    	iStream.read(b, off, len)
    	첫번째 매개변수 : 파일에서 읽은 데이터를 저장할 변수
    	두번째 매개변수 : offset(상대거리), 첫번째 매개변수(배열)에 저장할 위치
    	세번째 매개변수 : 파일에서 한 번 읽을 최대 크기
    	반환 데이터 : 실제 읽은 파일 데이터 사이즈 
    	*/
    	
    	byte[] b = new byte[1000];
    	// 파일의 크기만큼 읽어야 하기 때문에 반복문 while 사용
    	while(true){
    		
    		int currentSize = iStream.read(b, 0, b.length);
    		// 더이상 파일의 내용이 없을 때 종료 
    		// 만약 설정한 바이트의 수보다 읽어들이는 바이트 수가 작으면 -1이 되는것이 아닌 그 적은 바이트 수만큼만 반환된다. 
    		//ex) 1000 설정 -> 읽은 값 : 500 -> 500만큼만 반환
    		if(currentSize == -1){
    			break;
    		}
    		
    		// 변수(배열)에 데이터를 클라이언트에게 전달하기
    		// 실제 읽은 currentSize만큼 전달
    		// 이때, 문제가 생기는데 클라이언트는 전달받은 데이터가 파일 데이터인지 일반 데이터인지 모른다.
    		// 그래서 헤더에 파일데이터인지 화면에 출력할 일반 데이터인지 구분해주어야한다. -> 위에서 코드 작성
    		oStream.write(b, 0, currentSize);
    		
    	}
    	
    %>