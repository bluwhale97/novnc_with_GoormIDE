# novnc_with_GoormIDE
GoormIDE를 사용한 novnc세팅 입니다.

GitLab의 안정인님의 소스를 참고하였으며, 가장 간편하게 할수 있도록 했습니다.

참고 목록
https://git.blending.kr/snippets/12<br>
https://chhanz.github.io/linux/2019/12/13/linux-configure-novnc/ 

간단히 설명하자면,
GoormIDE에서 제공하는 Docker 컨테이너에서
vnc(Virtual Network Computing)를 통하여 데스크톱 환경으로 접속하는 것입니다.

이때, 기본 컨테이너에서는 데스크탑 환경이 설치가 안되어 있으므로 
현존하는 데스크탑 환경중 가장 가벼운 LXDE를 설치 하여 사용하였고
클라이언트 쪽에서 vnc 뷰어를 설치하여 접속하는 대신 
novnc를 사용하여 http에서 (인터넷 브라우저를 통하여) 간편히 접속할 수 있습니다.

일반적으로 
vnc에서 5901포트를 열게 되고
novnc에서 5901 -> 6080포트로 연결합니다.

최종 사용시에는 GoormIDE에서 6080포트를 포트포워딩 하여 사용하게 됩니다.
포트포워딩한 주소를 브라우저에서 접속하여 파일 리스트가 나오면 vnc.html로 접속하게 됩니다.
