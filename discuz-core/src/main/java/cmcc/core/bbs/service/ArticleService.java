package cmcc.core.bbs.service;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cmcc.common.service.SimpleCurdService;
import cmcc.core.bbs.entity.Article;
import cmcc.core.bbs.entity.Comment;
import cmcc.core.bbs.repository.ArticleRepository;
import cmcc.core.bbs.repository.CommentRepository;
import cmcc.core.sys.entity.User;

@Service
public class ArticleService extends SimpleCurdService<Article, Long> {
	
	public static final int PAGE_SIZE=20;
	
	@Autowired
	public ArticleRepository articleRepository;
	
	@Autowired
	public CommentRepository commentRepository;
	
	public List<Comment> findComment(User user){
		return this.commentRepository.findByUserOrderByCreateDate(user);
	}
	
	public void deleteComment(Long id){
		this.commentRepository.delete(id);
	}
	
	public void saveComment(Comment comment){
		comment.getArticle().setCommentcount(comment.getArticle().getCommentcount()+1);
		this.commentRepository.save(comment);
	}
	
	public List<Article> findByUser(User user){
		return this.articleRepository.findByUserOrderByCreateDate(user);
	}
	public List<User> hotUser(){
		List<User> users =  this.commentRepository.queryHotUsers();
		return users.size()<6?users:users.subList(0, 5);
	}
	/***
	 * 最新
	 * @param pageNumber
	 * @return
	 */
	public List<Article> findNew(final int pageNumber){
		
		if(pageNumber<1)
			throw new IllegalArgumentException("页码不能小于1");
		
        PageRequest pageRequest = new PageRequest(pageNumber - 1, PAGE_SIZE,
        		new Sort(Direction.DESC, "createDate"));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             return predicate;
             }
        };
        return  simpleCurdRepository.findAll(spec, pageRequest).getContent();
   }  
	
	/***
	 * 精华
	 * @param pageNumber
	 * @return
	 */
	public List<Article> findGood(final int pageNumber){
		
		if(pageNumber<1)
			throw new IllegalArgumentException("页码不能小于1");
		
        PageRequest pageRequest = new PageRequest(pageNumber - 1, PAGE_SIZE,
        		new Sort(Direction.DESC, "top").and(new Sort(Direction.DESC, "good").and(new Sort(Direction.DESC, "createDate"))));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             predicate.getExpressions().add(cb.equal(root.get("good").as(Integer.class), 1));
             return predicate;
             }
        };
        return  simpleCurdRepository.findAll(spec, pageRequest).getContent();
   }  
	
	/***
	 * 最热
	 * @param pageNumber
	 * @return
	 */
	public List<Article> findHot(final int pageNumber){
		
		if(pageNumber<1)
			throw new IllegalArgumentException("页码不能小于1");
		
        PageRequest pageRequest = new PageRequest(pageNumber - 1, PAGE_SIZE,
        		new Sort(Direction.DESC, "commentcount").and(new Sort(Direction.DESC, "createDate")));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
            
             return predicate;
             }
        };
        return  simpleCurdRepository.findAll(spec, pageRequest).getContent();
   }  
	
	/***
	 * o回复
	 * @param pageNumber
	 * @return
	 */
	public List<Article> findToBeReply(final int pageNumber){
		
		if(pageNumber<1)
			throw new IllegalArgumentException("页码不能小于1");
		
        PageRequest pageRequest = new PageRequest(pageNumber - 1, PAGE_SIZE,
        		new Sort(Direction.DESC, "createDate"));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
              predicate.getExpressions().add(cb.equal(root.get("commentcount").as(Integer.class), 0));
             return predicate;
             }
        };
        return  simpleCurdRepository.findAll(spec, pageRequest).getContent();
   }  
	/***
	 * 
	 * @param pageNumber start form 1
	 * @param categoryid
	 * @return
	 */
	public Page<Article> findAll(final int pageNumber,final Long  categoryid){
		
		if(pageNumber<1)
			throw new IllegalArgumentException("页码不能小于1");
		
        PageRequest pageRequest = new PageRequest(pageNumber - 1, PAGE_SIZE,
        		new Sort(Direction.DESC, "top").and(new Sort(Direction.DESC, "good").and(new Sort(Direction.DESC, "createDate"))));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (categoryid!=null) {
                  predicate.getExpressions().add(cb.equal(root.get("category").get("id").as(Long.class), categoryid));
             }
             return predicate;
             }
        };
        return  simpleCurdRepository.findAll(spec, pageRequest);
   }  
	
	
	public Page<Article> findAll(final int pageNumber, final int pageSize,final String title,final Long categoryid){
        PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        Specification<Article> spec = new Specification<Article>() {
             public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
             Predicate predicate = cb.conjunction();
             if (StringUtils.isNotBlank(title)) {
                  predicate.getExpressions().add(cb.like(root.get("title").as(String.class), "%"+title+"%"));
             }
             if (categoryid!=null) {
                 predicate.getExpressions().add(cb.equal(root.get("category").get("id").as(Long.class),categoryid));
             }
             return predicate;
             }
        };
        Page<Article> result = (Page<Article>) simpleCurdRepository.findAll(spec, pageRequest);
        return result;
  }

	public List<Article> findByCategory(Long id) {
		return this.articleRepository.findByCategoryId( id,new Sort(Direction.DESC, "top").and(new Sort(Direction.DESC, "createDate") ));
	} 
	
}
