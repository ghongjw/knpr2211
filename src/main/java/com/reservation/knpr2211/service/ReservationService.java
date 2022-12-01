
package com.reservation.knpr2211.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.entity.Reservation;
import com.reservation.knpr2211.repository.PlaceRepository;
import com.reservation.knpr2211.repository.ReservationRepository;

@Service
public class ReservationService {
	@Autowired
	MountainCodeService mcs;

	@Autowired
	PlaceRepository pr;

	@Autowired
	ReservationRepository rr;

	public List<PlaceDTO> campsiteView(String code) throws Exception {
		// A0101
		String category1 = code.substring(0, 1);
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);

		List<PlaceDTO> list = new ArrayList<PlaceDTO>();

		// Entity ID로 검색해서 get()을 통해 객체 반환
		// Place op = pr.findById(1).get();
		// System.out.println(op.toString());

		List<Place> places = pr.findByCategory1AndCategory2AndCategory3(category1, category2, category3);

		// Entity ID로 검색해서 get()을 통해 객체 반환
		// Place op = pr.findById(1).get();
		// System.out.println(op.toString());

		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();
			String c1 = place.getCategory1();
			String c2 = place.getCategory2();
			String c3 = place.getCategory3();
			String c4 = place.getCategory4();
			String roomName = place.getRoom().replace("0", "");

			String code1 = c1 + c2;
			String code2 = c1 + c2 + c3;
			String code3 = c1 + c2 + c3 + c4;

			dto.setCategory2(mcs.findCategory(code1));
			dto.setCategory3(mcs.findCategory(code2));
			dto.setCategory4(mcs.findCategory(code3));
			dto.setRoom(roomName);
			dto.setRoomMax(place.getRoomMax());

			list.add(dto);

		}

		return list;
	}

	public List<String> checkBoxList(String code) throws Exception {
		String category1 = code.substring(0, 1);
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);

		List<String> cmapsiteNames = new ArrayList<>();
		List<String> checkList = new ArrayList<>();

		List<Place> places = pr.findByCategory1AndCategory2AndCategory3(category1, category2, category3);
		for (Place place : places) {
			String c1 = place.getCategory1();
			String c2 = place.getCategory2();
			String c3 = place.getCategory3();
			String c4 = place.getCategory4();

			String code3 = c1 + c2 + c3 + c4;
			cmapsiteNames.add(mcs.findCategory(code3));

		}

		for (String campsite : cmapsiteNames) {
			if (!checkList.contains(campsite)) {
				checkList.add(campsite);
			}
		}

		return checkList;
	}

	public List<PlaceDTO> roomView(String code) {
		String category1 = code.substring(0, 1);
		String category2 = code.substring(1, 3);
		String category3 = code.substring(3, 5);
		String category4 = code.substring(5);

		List<PlaceDTO> rooms = new ArrayList<>();

		List<Place> places = pr.findByCategory1AndCategory2AndCategory3AndCategory4(category1, category2, category3,
				category4);

		for (Place place : places) {
			PlaceDTO dto = new PlaceDTO();

			String c1 = place.getCategory1();
			String c2 = place.getCategory2();
			String c3 = place.getCategory3();
			String c4 = place.getCategory4();

			String code3 = c1 + c2 + c3 + c4;

			String campsite = mcs.findCategory(code3);
			dto.setCategory4(campsite);

			String roomName = place.getRoom().replace("0", "");
			dto.setRoom(roomName);

			rooms.add(dto);

		}

		return rooms;
	}

	// (시작)작성자: 김수정 ==============================================
	// 제목 category1(대분류), category2(중분류) 코드 해석
	public String[] transtitleCode(String category) {
		String[] result = new String[2];
		result[0] = mcs.category1(category);
		result[1] = mcs.category2(category);
		return result;
	}

	// 야영장 객실종류 출력 (코드입력 'A01')
	public List<PlaceDTO> selectCamRoomType(String parkId) {
		// (출력 : A0101, A0102, A0102)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		// System.out.println("리스트 출력: " + listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			list.setNameCategory3(result);
			result = mcs.category4(list.getCategory4());
			list.setCategory4(result);
		}
		return listDate;
	}

	// 대피소 객실종류 출력 (코드입력 'B01')
	public List<PlaceDTO> selectSherRoomType(String parkId) {
		// (출력 : B0101, B0102, B0103)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		// System.out.println("리스트 출력: " + listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			list.setNameCategory3(result);
			result = mcs.category4(list.getCategory4());
			list.setCategory4(result);
		}
		return listDate;
	}

	// 생태탐방원 객실종류 출력 (코드입력 'A08')
	public List<PlaceDTO> selectEcoRoomType(String parkId) {
		// (출력 : C0801, C0802, C0803)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		// System.out.println("리스트 출력: " + listDate);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			list.setNameCategory3(result);
		}
		return listDate;
	}

	// 민박촌 객실종류 출력 (코드입력 'A08')
	public List<PlaceDTO> selectCotRoomType(String parkId) {
		// (출력 : C0801, C0802, C0803)
		List<PlaceDTO> listDate = pr.findAllByCategory2(parkId);
		for (PlaceDTO list : listDate) {
			String result = mcs.category1(list.getCategory1());
			list.setNameCategory1(result);
			result = mcs.category2(list.getCategory2());
			list.setNameCategory2(result);
			result = mcs.category3(list.getCategory3());
			result = transRoomType(result);
			list.setNameCategory3(result);

		}
		return listDate;
	}

	// 방 찾기 (코드입력 'A0801')
	public PlaceDTO selectCategory3(String parkId) throws Exception {
		String cat1 = parkId.substring(0,1);
		
		ArrayList<Place> datas = pr.findByCategory3(parkId);
		Place data = datas.get(0);
		PlaceDTO result = new PlaceDTO(data);
		String in = mcs.category1(data.getCategory1());
		result.setNameCategory1(in);
		in = mcs.category2(data.getCategory2());
		result.setNameCategory2(in);
		in = mcs.category3(data.getCategory3());
		if(cat1=="D")
			in = transRoomType(in);
		result.setNameCategory3(in);
		return result;
	}

	// 방 찾기 (코드입력 'A0801')
	public PlaceDTO selectCategory4(String parkId) throws Exception {
		String cat1 = parkId.substring(0,1);
		
		ArrayList<Place> datas = pr.findByCategory4(parkId);
		Place data = datas.get(0);
		PlaceDTO result = new PlaceDTO(data);
		String in = mcs.category1(data.getCategory1());
		result.setNameCategory1(in);
		in = mcs.category2(data.getCategory2());
		result.setNameCategory2(in);
		in = mcs.category3(data.getCategory3());
		if(cat1=="D")
			in = transRoomType(in);
		result.setNameCategory3(in);
		in = mcs.category4(data.getCategory4());
		result.setNameCategory4(in);
		return result;
	}

	// 민박촌 방종류명 변경(ex: '온돌' > '개인형 29.7㎡(9평/2명) 온돌')
	public String transRoomType(String roomType) {
		String category = "";
		if (roomType == "온돌") {
			category = "개인형 29.7㎡(9평/2명) 온돌";
		} else if (roomType == "침대") {
			category = "개인형 29.7㎡(9평/2명) 침대";
		} else if (roomType == "15평") {
			category = "가족형 49.5㎡(15평/6명) 복층";
		} else if (roomType == "18평") {
			category = "가족형 59.4㎡(18평/6명) 복층";
		} else {
			category = "단체형 105.6㎡(32평/13명) 복층";
		}
		return category;
	}

	// 남은 방 검증(코드입력 'D0101', 입실일, 퇴실일)
	public int roomNumCategory3(HashMap<String, String> keyData) throws ParseException {
		String parkId = keyData.get("category3");
		String startDate = keyData.get("startDate");
		String endDate = keyData.get("endDate");
		Integer diff = Integer.valueOf(keyData.get("diff"));
		// System.out.println("선택 코드: "+parkId);

		// 예약테이블에서 동일한 날짜와 동일한 방에 예약된 갯수알아내기
		// 1.입실일 기준으로 -2일 구하기(입실일 포함 예약된 날짜를 구하기 위함), 퇴실일 전날 날짜 구하기
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) sdf1.parse(startDate);
		Date date2 = (Date) sdf1.parse(endDate);
		Timestamp betweenStart = new Timestamp(date1.getTime());
		Timestamp betweenEnd = new Timestamp(date2.getTime());

		Calendar cal = Calendar.getInstance();
		cal.setTime(betweenStart);
		cal.add(Calendar.DATE, -2);
		betweenStart.setTime(cal.getTime().getTime());

		cal.setTime(betweenEnd);
		cal.add(Calendar.DATE, -1);
		betweenEnd.setTime(cal.getTime().getTime());
		// System.out.println("timeStamp형식: "+BetweenStart+", "+betweenEnd);
		// System.out.println(BetweenStart);

		List<Reservation> SelectDatas = rr.findAllByStartDayBetween(betweenStart, betweenEnd);
		// System.out.println("선택한 날짜 출력 =====");
		// 2.동일한 장소 코드 예약데이터 찾기
		List<Reservation> datas = new ArrayList<>();
		for (Reservation data : SelectDatas) {
			// System.out.println("코드: "+data.getCategory3()+", 관리번호: "+data.getSeq()+",
			// 시작일: "+data.getStartDay());
			if (data.getCategory3().equals(parkId)) {
				datas.add(data);
			}

		}
//		System.out.println("동일한 코드 출력 =====");
//		for (Reservation data : datas) {
//			System.out.println("코드: "+data.getCategory3()+", 관리번호: "+data.getSeq()+", 시작일: "+data.getStartDay());
//		}

		// 3. place테이블에서 해당코드로 roomMax 알아내기
		ArrayList<Place> list = pr.findByCategory3(parkId);
		Integer roomMax = list.get(0).getRoomMax(); // 해당 코드 방의 갯수
		System.out.println("장소 찾아내기>> 코드: " + list.get(0).getCategory3() + ", 룸 예약 가능 수: " + roomMax);

		ArrayList<Integer> arrList = new ArrayList<Integer>();
		// System.out.println("룸 비교 리스트(비어있는 상태) : "+arrList);
		for (int i = 0; i < diff; i++) {
			// 입실일 timeStamp형식 변환
			Timestamp timeStampStart = new Timestamp(date1.getTime());
			cal.setTime(timeStampStart);
			cal.add(Calendar.DATE, i);
			timeStampStart.setTime(cal.getTime().getTime());
			System.out.println("(선택한 사이날짜)실험군 날짜들 >> " + timeStampStart);

			for (Reservation data : datas) {
				// 예약된 데이터 한개씩 동일한 날짜 예약이 있는지 확인
				Integer count = roomMax;
				int num = Integer.valueOf(data.getAllDay());
				System.out.println("대조근 관리번호 : " + data.getSeq() + ", 박일수 : " + num + ", 시작-끝: " + data.getStartDay()
						+ ", " + data.getEndDay());
				for (int j = 0; j < num; j++) {
					Timestamp timeStampCompare = data.getStartDay();
					Calendar calCompare = Calendar.getInstance();
					calCompare.setTime(timeStampCompare);
					calCompare.add(Calendar.DATE, j);
					timeStampCompare.setTime(calCompare.getTime().getTime());
					System.out.println("대조군 날짜들 >> " + timeStampCompare);

					if (timeStampStart.equals(timeStampCompare)) {
						System.out.println("동일");
						count--;
					}
				}
				arrList.add(count);
			}
		}
		System.out.println(arrList);
		int min = arrList.get(0);
		for (int i = 0; i < arrList.size(); i++) {
			int num = arrList.get(i);
			if (min > num)
				min = num;
		}
		// System.out.println("룸 비교 리스트 : "+arrList+", 최솟값: "+min);
		return min;
	}

	// 예약하기
	public void reservation(ReservationDTO resDto, String startDt, String endDt) throws Exception {
		Reservation re = new Reservation();

		// 관리코드
		PlaceDTO place = selectCategory3(resDto.getCategory3());
		re.setCategory1(place.getCategory1());
		re.setCategory2(place.getCategory2());
		re.setCategory3(place.getCategory3());

		// 이용시간
		String betweenDt = resDto.getAllDay();
		if (betweenDt.equals("1박 2일")) {
			betweenDt = "1";
		} else if (betweenDt.equals("2박 3일")) {
			betweenDt = "2";
		} else if (betweenDt.equals("3박 4일")) {
			betweenDt = "3";
		}

		// 주문시간, 입실일, 퇴시일 자료형변환
		Date now = new Date();
		Timestamp orderTime = new Timestamp(now.getTime());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = (Date) sdf.parse(startDt);
		Date date2 = (Date) sdf.parse(endDt);
		Timestamp timeStampStart = new Timestamp(date1.getTime());
		Timestamp timeStampEnd = new Timestamp(date2.getTime());

		re.setOrderTime(orderTime);
		re.setStartDay(timeStampStart);
		re.setEndDay(timeStampEnd);
		re.setAllDay(betweenDt);
		re.setPeople(resDto.getPeople());
		re.setPrice(resDto.getPrice());
		re.setId("user1");
		rr.save(re).getSeq();
	}

	public void test() throws ParseException {
		// date > timestamp 형변환
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = (Date) format.parse("2022-02-03");
//		Timestamp timestamp = new Timestamp(date.getTime());
//		System.out.println("타임스탬프 : " + timestamp);

		// 3박4일 시작일 + 3일
//		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//		String startDay = "2022-11-24";
//		String endDay = "2022-11-27";
//		
//		Date date1 = (Date) sdf1.parse(startDay);
//		Timestamp BetweenStart = new Timestamp(date1.getTime());
//		
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(BetweenStart);
//		cal.add(Calendar.DATE, 3);
//		BetweenStart.setTime(cal.getTime().getTime());
//		System.out.println(BetweenStart);

		// 데이터 삽입하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		Timestamp orderTime = new Timestamp(now.getTime());

		String startDay = "2022-12-04";
		String endDay = "2022-12-05";
		Date date1 = (Date) sdf.parse(startDay);
		Date date2 = (Date) sdf.parse(endDay);
		Timestamp timeStampStart = new Timestamp(date1.getTime());
		Timestamp timeStampEnd = new Timestamp(date2.getTime());
		System.out.println(timeStampStart.getDate());

//		Reservation re = new Reservation();
//		re.setId("user1");
//		re.setCategory1("D");
//		re.setCategory2("D01");
//		re.setCategory3("D0103");
//		re.setOrderTime(orderTime);
//		re.setPeople(2);
//		re.setPrice("40000");
//		
//		re.setAllDay("1");
//		re.setStartDay( timeStampStart);
//		re.setEndDay(timeStampEnd);
//		rr.save(re).getSeq();
	}

	// (끝)작성자: 김수정 ==============================================
}
