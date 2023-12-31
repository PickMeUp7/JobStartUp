package com.pickmeup.jobstartup.recruiter.jobposting.service;

import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.SearchDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.repository.JobPostingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class JobPostingServicelmpl implements JobPostingService{

    private final JobPostingRepository jobPostingRepository;

    //공고작성
    @Override
    public void insertJobPostingDTO(JobPostingDTO jobPostingDTO) throws Exception {
        jobPostingRepository.insertJobPostingDTO(jobPostingDTO);
    }

    //채용공고 목록조회
    @Override
    public List<JobPostingDTO> selectJPlist(){
        return jobPostingRepository.paginationPosting();
    }


    //채용공고 목록조회(검색)
    @Override
    public List<JobPostingDTO> selectJPlistBySearch(){
        return jobPostingRepository.paginationPostingBySearch();
    }

    //공고상세조회
    @Override
    public JobPostingDTO selectJPdetail(int posting_no)  {
        JobPostingDTO jobPostingDTO = jobPostingRepository.selectJPdetail(posting_no);
        return jobPostingDTO;
    }

    //공고수정
    @Override
    public void JPmodify(Map<String, Object> map) throws Exception {
        jobPostingRepository.JPmodify(map);
    }

    //삭제
    @Override
    public void JPdelete(int posting_no) throws Exception{
        jobPostingRepository.JPdelete(posting_no);

    }

    //상위 지역 리스트 가져오기
    @Override
    public List<LocDTO> getUpperLoc() {
        List<LocDTO> upperLoc = jobPostingRepository.getUpperLoc();
        return upperLoc;
    }

    //상위 지역에 따른 하위 지역 리스트 가져오기
    @Override
    public List<LocDTO> getLowerLoc(String upperLoc) {
        List<LocDTO> lowerLoc = jobPostingRepository.getLowerLoc(upperLoc);
        return lowerLoc;
    }

   /* //page : 현재 페이지, size : 페이지당 게시물 수
    @Override
    public Map<String, Object> paginationPosting(int page, int size) {
        int offset = (page - 1) * size;

        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("offset", offset);
        paramMap.put("size", size);

        List<JobPostingDTO> jobPostingList = jobPostingRepository.paginationPosting(paramMap);
        int totalCount = jobPostingRepository.countPosting();
        int totalPages = (int) Math.ceil((double) totalCount / size);

        Map<String, Object> result = new HashMap<>();
        result.put("jobPostingList", jobPostingList);
        result.put("totalPages", totalPages);
        return result;
    }*/

    @Override
    public Map<String, Object> paginationPosting(int page, int size) {
        int offset = (page - 1) * size;

        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("offset", offset);
        paramMap.put("size", size);

        List<JobPostingDTO> jobPostingList = jobPostingRepository.paginationPosting(paramMap);
        int totalCount = jobPostingRepository.countPosting();
        int totalPages = (int) Math.ceil((double) totalCount / size);

        // 페이지네이션 번호를 5개씩 가져오도록 수정
        int startPage = Math.max(1, page - 2); // 현재 페이지 기준으로 앞에 2페이지까지 표시
        int endPage = Math.min(startPage + 4, totalPages); // 시작 페이지부터 최대 5페이지까지 표시

        Map<String, Object> result = new HashMap<>();
        result.put("jobPostingList", jobPostingList);

        // 수정된 startPage와 endPage 정보도 함께 반환
        result.put("startPage", startPage);
        result.put("endPage", endPage);

        result.put("totalPages", totalPages);
        return result;
    }

    @Override
    public Map<String, Object> paginationPostingBySearch(int page, int size, String upperLoc, String lowerLoc, String keyword) {
        return null;
    }

    //검색 통한 목록 조회
    @Override
    public Map<String, Object> paginationPostingBySearch(int page, int size, SearchDTO searchDTO) {

        String keyword = searchDTO.getKeyword();
        String lowerLoc = searchDTO.getLowerLocSelected();
        String posting_jobCode = searchDTO.getPosting_jobCode();
        int offset = (page - 1) * size;

        Map<String, Object> map = new HashMap<>();
        map.put("offset", offset);
        map.put("size", size);
        map.put("posting_jobCode", posting_jobCode);
        map.put("lowerLoc", lowerLoc);
        map.put("keyword", keyword);

        List<JobPostingDTO> jobPostingList = jobPostingRepository.paginationPostingBySearch(map);

        int totalCount = jobPostingRepository.countPostingBySearch(map);
        int totalPages = (int) Math.ceil((double) totalCount / size);

        // 페이지네이션 번호를 5개씩 가져오도록 수정
        int startPage = Math.max(1, page - 2); // 현재 페이지 기준으로 앞에 2페이지까지 표시
        int endPage = Math.min(startPage + 4, totalPages); // 시작 페이지부터 최대 5페이지까지 표시

        Map<String, Object> result = new HashMap<>();
        result.put("jobPostingList", jobPostingList);

        // 수정된 startPage와 endPage 정보도 함께 반환
        result.put("startPage", startPage);
        result.put("endPage", endPage);

        result.put("totalPages", totalPages);
        return result;
    }

    //조회수
    @Override
    public void postingCnt(int postingNo) {
        jobPostingRepository.postingCnt(postingNo);
    }

}
