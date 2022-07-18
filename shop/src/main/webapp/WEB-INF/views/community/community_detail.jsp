<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="commu-detail-center-container">
      <div class="commu-detail-container">
        <div class="commu-detail-img-container">
          <img class="commu-detail-img" alt="" src="/image/model1.jpg" />
        </div>

        <div class="commu-detail-trim"></div>

        <div class="commu-detail-div-main-container">
          <div>
            <div
              class="commu-detail-like-icon-box"
              id="commu-detail-like-icon-box"
            >
              <i
                style="color: black"
                id="before-like"
                class="fa-regular fa-heart fa-lg"
              ></i>
            </div>

            <!--<button class="btn-good commu-btn">Good Look</button>-->
            <span class="commu-detail-span-goodlook-count commu-detail-text"
              >1,000K</span
            >
          </div>

          <hr class="hr-goodlook-line" />

          <div style="height: 10px"></div>

          <div>
            <div class="commu-detail-div-title-container">
              <h3 class="commu-detail-text">
                오늘의 데일리룩오늘의 데일리룩오늘의 데일리룩오늘의 데일리룩
              </h3>
            </div>
            <div class="commu-detail-div-title-container">
              <span class="p-username commu-detail-text">_hh______</span>
            </div>
          </div>

          <div style="height: 20px"></div>

          <div>
            <div class="commu-detail-div-content-container">
              <span class="commu-detail-span-content commu-detail-text">
                Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nisi,
                eius cumque vitae temporibus architecto fuga ducimus dolor
                voluptatum repudiandae libero ariatur. Temporibus laborum illo
                sunt saepe voluptatem architecto neque aliquam. Lorem, ipsum
                dolor sit amet consectetur adipisicing elit. Nisi, eius cumque
                vitae temporibus architecto fuga ducimus dolor voluptatum
                repudiandae libero ariatur. Temporibus laborum illo sunt saepe
                voluptatem architecto neque aliquam. Lorem, ipsum dolor sit amet
                consectetur adipisicing elit. Nisi, eius cumque vitae temporibus
                architecto fuga ducimus dolor voluptatum repudiandae libero
                ariatur. Temporibus laborum illo sunt saepe voluptatem
                architecto neque aliquam. Lorem, ipsum dolor sit amet
                consectetur adipisicing elit. Nisi, eius cumque vitae temporibus
                architecto fuga ducimus dolor voluptatum repudiandae libero
                ariatur. Temporibus laborum illo sunt saepe voluptatem
                architecto neque aliquam. Lorem, ipsum dolor sit amet
                consectetur adipisicing elit. Nisi, eius cumque vitae temporibus
                architecto fuga ducimus dolor voluptatum repudiandae libero
                ariatur.
              </span>
            </div>
          </div>

          <div style="height: 20px"></div>

          <div>
            <i class="fa-regular fa-pen-to-square"></i>
            <button class="commu-detail-btn-up commu-detail-btn">up</button>
            <div>
              <input
                type="text"
                placeholder="한 마디"
                class="input-reply commu-detail-input"
              />
            </div>
          </div>
          <div style="height: 20px"></div>

          <div class="commu-detail-reply-container">
            <div class="commu-detail-reply-firstline-container">
              <span class="commu-detail-reply-user commu-detail-reply-text"
                >작성자</span
              >
              <div>
                <button class="commu-detail-btn-update commu-detail-btn-reply">
                  수정
                </button>
                <button class="commu-detail-btn-delete commu-detail-btn-reply">
                  삭제
                </button>
              </div>
            </div>

            <textarea
              class="commu-detail-reply-content commu-detail-reply-text"
              readonly
            >
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur ea tempore nam veniam optio ut voluptatem dignissimos natus autem deleniti illum, cumque magnam porro unde corporis sint quaerat quo molestias!</textarea
            >
          </div>
        </div>
        <div style="height: 70px"></div>
      </div>
    </div>
<script>
	$(document).ready(function () {
	  fixTextAreaHeight();
	
	  $("#before-like").bind("click", () => {
	    document.getElementById("commu-detail-like-icon-box").innerHTML =
	      '<i class="fa-solid fa-heart fa-lg" style="color: rgb(240, 81, 115)"></i>';
	  });
	});
	
	function fixTextAreaHeight() {
	  var textEle = $(".commu-detail-reply-content");
	  textEle[0].style.height = "auto";
	  var textEleHeight = textEle.prop("scrollHeight");
	  textEle.css("height", textEleHeight);
	}
</script>
  </body>
</html>
