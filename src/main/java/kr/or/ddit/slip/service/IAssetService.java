package kr.or.ddit.slip.service;

import java.util.List;

import kr.or.ddit.slip.model.AssetVo;

public interface IAssetService {

	List<AssetVo> getAllAsset();
	
	int insertAsset(AssetVo assetVo);
	
	int updateAsset(AssetVo assetVo);
}
