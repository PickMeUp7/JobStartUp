package com.pickmeup.jobstartup.member.service;

import com.pickmeup.jobstartup.member.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.member.dto.JoinCompanyDTO;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberServiceImpl implements MemberService {
    private final MemberRepository memberRepository;
    private final ModelMapper modelMapper;
    private final BCryptPasswordEncoder passwordEncoder;
    //    private final DefaultMessageService messageService;
    private final UserSecurityService userSecurityService;

    //아이디 중복 여부 검사
    @Override
    public boolean isDuplicateMemberId(String memberId) {
        int count = memberRepository.countByMemberId(memberId);
        return count > 0;
    }

    //일반회원가입
    @Override
    public Member join(JoinCommonDTO joinCommonDTO) {
        if (!isValidDate(joinCommonDTO.getMember_birth())) {
            throw new IllegalArgumentException("YYYYMMDD 입력 형식을 확인해 주세요");
        }

        Member member = convertDtoToEntity(joinCommonDTO);

        String encryptedPassword = passwordEncoder.encode(joinCommonDTO.getMember_pw());
        member.setMember_pw(encryptedPassword);

        String menuId = getMemberMenuId(joinCommonDTO.getMember_type().getCode());
        member.setMenu_id(menuId);

        memberRepository.savePerson(member);
        log.info("서비스 Loaded user: {}, with authorities: {}", member.getMember_id(), member.getMember_type());
        return member;
    }

    //기업 회원가입
    @Override
    public Member join(JoinCompanyDTO joinCompanyDTO) {
        if (!isValidDate(joinCompanyDTO.getMember_birth())) {
            throw new IllegalArgumentException("YYYYMMDD 입력 형식을 확인해 주세요");
        }

        Member member = convertDtoToEntity(joinCompanyDTO);

        String encryptedPassword = passwordEncoder.encode(joinCompanyDTO.getMember_pw());
        member.setMember_pw(encryptedPassword);

        String menuId = getMemberMenuId(joinCompanyDTO.getMember_type().getCode());
        member.setMenu_id(menuId);

        memberRepository.savePerson(member);
//        memberRepository.saveCompany(member);
        log.info("서비스 Loaded user: {}, with authorities: {}", member.getMember_id(), member.getMember_type());
        return member;
    }

    //회원 구분에 따른 메뉴ID 가져오기
    @Override
    public String getMemberMenuId(String memberType) {
        return memberRepository.selectMenuId(memberType);
    }

//    private Member convertDtoToEntity(JoinCommonDTO joinCommonDTO) {
//        Member member = modelMapper.map(joinCommonDTO, Member.class);
//        return member;
//    }
//
//    private Member convertDtoToEntity(JoinCompanyDTO joinCompanyDTO) {
//        Member member = modelMapper.map(joinCompanyDTO, Member.class);
//        return member;
//    }

    private <T> Member convertDtoToEntity(T dto) {
        Member member = modelMapper.map(dto, Member.class);
        return member;
    }

    //생년월일 유효성 검사
    public boolean isValidDate(String birthDate) {
        if (birthDate.length() != 8) {
            return false;
        }

        try {
            Integer.parseInt(birthDate);
        } catch (NumberFormatException e) {
            return false;
        }

        int year = Integer.parseInt(birthDate.substring(0, 4));
        int month = Integer.parseInt(birthDate.substring(4, 6));
        int day = Integer.parseInt(birthDate.substring(6, 8));

        if (month < 1 || month > 12 || day < 1 || day > 31) {
            return false;
        }

        if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
            return false;
        }

        if (month == 2) {
            if (day > 29) {
                return false;
            }
            if (day == 29) {
                if (!(year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))) {
                    return false;
                }
            }
        }

        return true;
    }

    //4자리 인증번호 받기
//    @Override
//    public boolean sendSMS(String userPhoneNumber, String randomNumber) {
//        Message message = new Message();
//        message.setFrom("01047975797");
//        message.setTo(userPhoneNumber);
//        message.setText("인증번호는 " + randomNumber + "입니다.");
//
//        try {
//            SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
//
//            if("2000".equals(response.getStatusCode())) {
//                return true;
//            } else {
//                return false;
//            }
//        } catch(Exception e) {
//            return false;
//        }
//    }
//
    @Override
    public boolean isDuplicateEmail(String emailInput) {
        return memberRepository.countByEmail(emailInput) > 0;
    }

    @Override
    public void autoLogin(Member member) {
        UserDetails userDetails = userSecurityService.loadUserByUsername(member.getMember_id());
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);
    }
}