package cmcc.core.sys.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cmcc.core.bbs.entity.Article;
import cmcc.core.sys.entity.BbsFavorite;
import cmcc.core.sys.entity.User;
import cmcc.core.sys.repository.BbsFavoriteRepository;
@Service
public class FavoriteService  {
	
	public static final int PAGE_SIZE=10;
	
	@Autowired
	private  BbsFavoriteRepository bbsFavoriteRepository;
	
	
	@Transactional
	public void favoriteBbs(Article article,User user){
		this.bbsFavoriteRepository.delete(user, article);
		BbsFavorite bean = new BbsFavorite();
		bean.setBbs(article);
		bean.setUser(user);
		this.bbsFavoriteRepository.save(bean);
	}
	
	
	
	@Transactional
	public void unFavoriteBbs(Article article,User user){
		this.bbsFavoriteRepository.delete(user, article);
	}
	
	
	public List<BbsFavorite> findBbsFavorites(final User user){
		return this.bbsFavoriteRepository.findByUserOrderByCreateDateDesc(user);
    } 
	
	
	
	public List<BbsFavorite> findBbsFavorites(final int pageNumber,final User user){
			if(pageNumber<1)
				throw new IllegalArgumentException("页码不能小于1");
	        PageRequest pageRequest = new PageRequest(pageNumber - 1, PAGE_SIZE, new Sort(Direction.DESC, "createDate"));
	        Specification<BbsFavorite> spec = new Specification<BbsFavorite>() {
	             public Predicate toPredicate(Root<BbsFavorite> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
	             Predicate predicate = cb.conjunction();
	             if (user!=null) {
	                  predicate.getExpressions().add(cb.equal(root.get("user").as(User.class), user));
	             }
	             return predicate;
	             }
	        };
	        return  bbsFavoriteRepository.findAll(spec, pageRequest).getContent();
	   }  
	
	
}
