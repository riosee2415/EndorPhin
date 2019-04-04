package kr.or.ddit.slip.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.slip.dao.IAssetDao;
import kr.or.ddit.slip.model.AssetVo;

@Service("assetService")
public class AssetServiceImpl implements IAssetService{

	@Resource(name="assetDao")
	private IAssetDao assetDao;
	
	@Override
	public List<AssetVo> getAllAsset() {
		return assetDao.getAllAsset();
	}

	@Override
	public int insertAsset(AssetVo assetVo) {
		return assetDao.insertAsset(assetVo);
	}

	@Override
	public int insertStatusAsset(AssetVo assetVo) {
		return assetDao.insertStatusAsset(assetVo);
	}
	@Override
	public int updateAsset(AssetVo assetVo) {
		return assetDao.updateAsset(assetVo);
	}



}
