package kr.or.ddit.slip.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.slip.model.AssetVo;

@Repository("assetDao")
public class AssetDaoImpl implements IAssetDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AssetVo> getAllAsset() {
		return sqlSessionTemplate.selectList("asset.getAllAsset");
	}

	@Override
	public int insertAsset(AssetVo assetVo) {
		return sqlSessionTemplate.insert("asset.insertAsset", assetVo);
	}

	@Override
	public int updateAsset(AssetVo assetVo) {
		return sqlSessionTemplate.update("asset.updateAsset",assetVo);
	}

}
