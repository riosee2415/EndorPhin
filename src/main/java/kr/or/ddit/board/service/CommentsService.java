package kr.or.ddit.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.ICommentsDao;

@Service("commentsService")
public class CommentsService implements ICommentsService{

	@Resource(name="commentsDao")
	private ICommentsDao commentsDao;
}
