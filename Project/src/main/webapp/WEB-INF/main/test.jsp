<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	  #dragDropArea{
        background-color: #f4f4f4;
        margin: 10px;
        padding: 10px;
        border: #ddd solid 2px;
        min-height: 200px;
        text-align: center;
        border-radius: 5px;
    }

    #dragDropArea p{
        color: #999;
        font-weight: bold;
        font-size: 14px;
        font-size: 1.4em;
    }
    #dragDropArea .drag-drop-buttons{
        margin-top: 20px;
        font-size: 12px;
        font-size: 1.2em;
    }
    .drag-drop-buttons input{
        margin: auto;
    }

    .fileInputButton {
        color: white;  
        background-color: lightgray;
        padding: 10px;
        border-radius: 10px;
        cursor:pointer;
        color:#999;
    }
</style>
</head>
<body>
<script src="CSS/jquery-3.6.0.min.js"></script>

<div class="Container">
    <div id="dragDropArea">
        <div class="drag-drop-inside">
            <p class="drag-drop-info">여기에 파일을 드래그 앤드 드롭</p>
            <p>또는</p>
            <p class="drag-drop-buttons">
                <label class="fileInputButton">
                    ＋ 첨부 파일 선택
                    <input id="fileInput" type="file" style="display:none;" multiple="multiple" onchange="javascript:fnSelectFile();"></input>
                </label>
            </p>
            <div id="fileList" style="text-align:center;"></div>
        </div>
    </div>
    <button type="button" class="btn btn-primary btn-block" onclick="javascript:fnSendFile();">Upload</button>
</div>
<script>
var _FormData = new FormData(); // 서버 전송 폼 변수
var _FILE_MAX_SIZE = 10;        // 업로드 파일 최대 사이즈

window.onload = function() {
    // 드래그 앤드 드롭 이벤트가 일어나는 태그
    var fileArea = document.getElementById('dragDropArea');
    // 첨부파일  Input태그
    var fileInput = document.getElementById('fileInput');
    // 파일을 드래그 해서 범위 안에 두었을 때 발생하는 이벤트
    fileArea.addEventListener('dragover', function (evt) {
        evt.preventDefault();
        fileArea.classList.add('dragover');
    });
    // 드래그 한 파일을 범위 밖으로 가져 갈 때 발생하는 이벤트
    fileArea.addEventListener('dragleave', function (evt) {
        evt.preventDefault();
        fileArea.classList.remove('dragover');
    });

    // 드래그 한 파일을 범위 안에 두고 마우스를 떼었을 때 발생하는 이벤트
    fileArea.addEventListener('drop', function (evt) {
        evt.preventDefault();
        fileArea.classList.remove('dragenter');
        // 드래그 한 파일 정보를 가져오는 부분
        var files = evt.dataTransfer.files;
        // 첨부파일  Input태그에 드래그 한 파일을 적용
        fileInput.files = files;
        // 파일 선택 확인 함수 호출
        fnSelectFile();
    });
}

// 파일 선택 확인
function fnSelectFile() {
    // 파일 사이즈 확인
    var maxsize = _FILE_MAX_SIZE * 1024 * 1024;
    // 첨부파일 Input태그 호출
    var input = document.getElementById('fileInput');
    // Input 태그에서 선택된 파일 개수 만큼 반복
    for (var i = 0; i < input.files.length; ++i) {
        var name = input.files.item(i).name; // 파일명
        var size = input.files.item(i).size; // 파일 사이즈
        
        // 파일 사이즈 체크
        if(size > maxsize) {
            alert("파일은 " + _FILE_MAX_SIZE + "Byte 이하만 가능합니다.");
        }
        else {
            // 폼 데이터에 파일 정보 보존
            _FormData.append("files", input.files[i]); 
        }
    }

    // 선택 파일을 화면에 표시
    fnDisplayFileList();
}

// 선택한 파일을 삭제
function fnCancelFile(name, size)  {  
    // 폼 데이터의 파일 정보 취득
    var filelist = _FormData.getAll("files");
    // 폼 데이터의 파일 정보 삭제
    _FormData.delete("files");
    // 취득한 파일 정보 개수 만큼 반복
    for(var file of filelist) {
        // 삭제 대상 파일인 경우 스킵
        if(file.name == name && file.size == size) {
            continue;
        }
        // 폼 데이터에 파일 정보를 다시 보존
        _FormData.append("files", file); 
    }

    // 선택 파일을 화면에 표시
    fnDisplayFileList();
}

// 선택 파일을 화면에 표시
function fnDisplayFileList() {
    var children = "";
    var output = document.getElementById('fileList');
    filelist = _FormData.getAll("files");
    for(var file of filelist) {
        var name = file.name;
        var size = file.size;
        children += '📎&nbsp;&nbsp;&nbsp;' + name + ' ';
        children += "<span style='cursor:pointer;color:red;' onclick='javascript:fnCancelFile(\"" + name + "\", " + size +");'>✖</span><Br />";
    }
    // 추가되는 파일 목록 태그를 HTML에 적용
    output.innerHTML = children;
}

// 파일 업로드 작업
function fnSendFile() {
    $.ajax({  
        url: '/Home/FileUpload',  
        type: "POST",  
        contentType: false,
        processData: false,
        data: _FormData,  
        async: false,  
        success: function (data) {  
            if(data.result == 0) {
                // 파일 업로드 후 리스트 초기화
                alert("파일 업로드 완료!");
                // 컨트롤러 메인 페이지로 이동
                window.location.href = "/Home";
            }
            else {
                alert("파일 업로드 실패!");
            }
        },  
        error: function (err) {  
            // 에러일 경우 에러 메세지 출력
            alert(err.statusText);  
        }  
    }); 
}
</script>
</body>
</html>