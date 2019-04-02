package kr.or.ddit.slip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.slip.model.AssetVo;

@Repository("assetDao")
public interface IAssetDao {

	List<AssetVo> getAllAsset();
	
	int insertAsset(AssetVo assetVo);
	
	int updateAsset(AssetVo assetVo);
}
