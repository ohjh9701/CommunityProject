package com.community.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {
    private int startPage;    // 화면에 보여질 시작 번호
    private int endPage;      // 화면에 보여질 끝 번호
    private boolean prev, next; // 이전, 다음 버튼 표시 여부
    private int total;        // 전체 게시글 수
    private int currentPage;  // 현재 사용자가 보고 있는 페이지

    public Paging(int total, int currentPage) {
        this.total = total;
        this.currentPage = currentPage;

        // 1. 끝 페이지 계산 (현재 10개씩 보여준다고 가정)
        // 현재 페이지가 3이면 (3/10.0) -> 올림 -> 1 * 10 = 10페이지가 끝 번호
        this.endPage = (int) (Math.ceil(currentPage / 10.0)) * 10;

        // 2. 시작 페이지 계산
        this.startPage = this.endPage - 9;

        // 3. 진짜 마지막 페이지 계산 (데이터 총 개수 기준)
        int realEnd = (int) (Math.ceil((total * 1.0) / 10));

        // 4. 화면에 보여줄 끝 번호 보정
        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        // 5. 이전/다음 버튼 유무 결정
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }
}