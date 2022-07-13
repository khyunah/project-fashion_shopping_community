	// Web API 교차 관찰자(Intersection Observer)
	/**
		Skeleton UI란?
		실제 데이터가 렌더링 되기 전에 보이게 될 화면의 윤곽을 먼저 그려주는
		로딩 애니메이션이다.
		사용자의 이탈을 막고 '어떤 것들이 보여질 것이다' 라고 미리 알려주는 효과를 준다.
	 */ 
	
	
	const makeSpinner = () => {
	  const spinner = document.createElement('div'); // div 요소 생성
	  const spinnerImage = document.createElement('img'); // img 요소 생성
	  
	  spinner.classList.add('loading');
	  spinnerImage.setAttribute('src', 'image/spinner.gif');
	  spinnerImage.classList.add('spinner');
	  spinner.appendChild(spinnerImage);
	  return spinner;
	};
	
	const makeSkeleton = () => {
	  const skeleton = document.createElement('li');
	  const skeletonImage = document.createElement('div');
	  const skeletonText = document.createElement('p');
	  skeleton.classList.add('skeleton');
	  skeletonImage.classList.add('skeleton__image');
	  skeletonText.classList.add('skeleton__text');
	  skeletonText.textContent = ' '; // 스켈레톤 애니메이션 중 카드폼 안에 미리 들어가는 텍스트
	  skeleton.appendChild(skeletonImage);
	  skeleton.appendChild(skeletonText);
	  return skeleton;
	};
	
	
	const list = document.querySelector('.card-list');
	const items = document.querySelectorAll('.lCard');
	const skeletonItems = Array.from({ length: items.length }, () =>
	  makeSkeleton()
	);
	const spinner = makeSpinner();
	
	// 스켈레톤 추가
	const addSkeleton = () => {
	  skeletonItems.forEach((item) => list.appendChild(item));
	};
	
	// 스켈레톤 제거
	const removeSkeleton = () => {
	  skeletonItems.forEach((item) => list.removeChild(item));
	};
	
	// 컨텐츠를 기다리는 로딩이 시작되면 스켈레톤과 스피너를 추가한다. 
	const loadingStart = () => {
	  addSkeleton();
	  list.appendChild(spinner);
	};
	
	// 로딩이 끝났다면 스켈레톤과 스피너를 제거한다.
	const loadingFinish = () => {
	  removeSkeleton();
	  list.removeChild(spinner);
	};
	
	// 컨텐츠를 추가시킨다.
	const addNewContent = () => {
		// cloneNode로 복제하고 appendChild로 기존 컨텐츠에 붙임
	  items.forEach((item) => list.appendChild(item.cloneNode(true)));
	};
	
	
	// 옵션과 함께 전달인자로 작성하는 콜백함수는 entries와 io를 매개변수로 갖는다.
	// entries는 관찰 중인 모든 대상을 담은 배열이고, 요소 각각을 참조하기 위해
	// forEach로 개별적으로 접근한다.
	// io는 관찰자 객체이다.
	const ioCallback = (entries, io) => {
	  entries.forEach((entry) => {
	    if (entry.isIntersecting) {
	      io.unobserve(entry.target); // 기존의 관찰하던 요소는 더 이상 관찰을 중지한다.
	     
	     // 새로운 컨텐츠를 추가시키고 추가시킨 컨텐츠의 마지막 요소 관찰을 시작한다.
	      loadingStart(); 
	      setTimeout(() => {
	        addNewContent();
	        loadingFinish();
	        observeLastItem(io, document.querySelectorAll('.lCard'));
	      }, 2000);
	    }
	  });
	};
	
	
	const observeLastItem = (io, items) => {
	  const lastItem = items[items.length - 1];
	  io.observe(lastItem); // 관찰할 요소 lastItem
	};
	
	
	// threshold : 관찰 대상이 화면 내에 얼마나 들어왔을 때 콜백 함수를 호출할 지
	// 결정하는 값으로 default = 0%, 최대 1(100%)까지 지정가능하며, 0.7이므로 70%이상 보였을 때
	// 콜백 함수를 호출한다.
	const io = new IntersectionObserver(ioCallback, { threshold: 0.7 });
	observeLastItem(io, items); 
