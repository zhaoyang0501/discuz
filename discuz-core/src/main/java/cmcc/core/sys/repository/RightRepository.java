package cmcc.core.sys.repository;
import java.util.List;


import cmcc.common.repository.SimpleCurdRepository;
import cmcc.core.sys.entity.Right;
public interface RightRepository   extends SimpleCurdRepository<Right ,Long>{
	public List<Right> queryByParent(Right dept);
}
