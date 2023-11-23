### GCD / Operation
- 큐를 이용해 분산 처리
- GCD/ operation을 사용해 쓰레드 숫자를 관리
- 직접 쓰레드를 생성하지 않고 작업 분산에 따른 쓰레드를 관리
  
- GCD - Grand Central Dispatch
  - 간단한일, 메서드위주
  - 종류 global(main), global, private
    - global(main) - serial, main thread
    - global - concurrent, Qos
      - userInteractive 거의즉시
        - UI, animation, ui response
      - userInitiated 몇초
        - 비동기적 처리작업
      - default 
        - 일반작업
      - utility 몇초에서 몇분
        - progress indicator, 계산, IO, Networking, 지속적인 데이터 feeds
      - background 속도보다는 에너지 효율성중시 몇분이상
        - 시간이 안중요한작업, 데이터 미리가져오기, 데이터베이스유지,
      - unspecified
        - legacy api
    - private(custom)
      - 둘다 설정가능 serial, concurrent 기본은 serial
- Operation
  - 복잡한일
  - 작업과 관련된 코드와 데이터를 캡슐화한 객체 (클래스로 만들어짐)
# 큐에 보내기
```
// 동기적으로 보내는 코드는 실질적으로 메인쓰레드에서 작동
DispatchQueue.global().sync {
  
}

DispatchQueue.global().async {
  
}
```

### main queue
DispathQueue.main.async{}
메인쓰레드

### global queue
- Concurrent(동시) : 여러개의 쓰레드로 분산 처리 함

Dispatch.Queue.global(qos: .userInteractive)
유저와 직접적 인터렉티브 UI 업데이트 애니메이션 UI 반응 관련

Dispatch.Queue.global(qos: .userInitiated)
유저가 즉시 필요하긴 하지만 비동기적으로 처리된 작업 몇초

Dispatch.Queue.global()
일반적인 작업

Dispatch.Queue.global(qos: .utility)
인데케이터와 함께 길게 실행되는 작업, 계산, IO, Networking 지속적인 feeds

DispatchQueue.global(qos: .background)    
눈에 보이지 않는 부분의 작업. 완료 시간 중요X

Dispatch.Queue.global(qos: .unspecified)
legacy API

- 우선 순위가 더 높은 큐의 작업을 우선적으로 더 많은 쓰레드에 배치하고 배터리를 집중적으로 소모하게 된다.

### Private Queue
- 디폴트 Serial, Concurrent로 설정가능


### 큐의 서비스 품질
- DispatchQueue.global(qos: .userInitiated)
- DispatchQueue.global()


thread 1

thread 2 task2
thread 3 task2
thread 4 task2
thread 5 task2
thread 6 task1 task1
thread 7 task1 task1

* backgroundqueue에서 작업을 실행하는 내부블록에서 작업우선순위를 높이는 방법
let queue = DispatchQueue.global(.backgorund)

queue.async(qos: .utility) {
  // 처음 선언하였던 부분에 영향받지않고 우선순위가 높아짐
}
