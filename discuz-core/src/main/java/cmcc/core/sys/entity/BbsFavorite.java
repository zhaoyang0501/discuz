package cmcc.core.sys.entity;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import cmcc.common.entity.BaseEntity;
import cmcc.core.bbs.entity.Article;

@Entity
@Table(name = "t_sys_bbsfavorite")
public class BbsFavorite extends BaseEntity<Long>{
	
	@OneToOne
	private Article bbs;
	
	@ManyToOne
	private User user;
	
	public Article getBbs() {
		return bbs;
	}

	public void setBbs(Article bbs) {
		this.bbs = bbs;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
