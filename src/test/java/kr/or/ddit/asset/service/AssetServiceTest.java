package kr.or.ddit.asset.service;

import static org.junit.Assert.assertNotNull;

import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.service.IAssetService;

public class AssetServiceTest extends LogicConfig{

	@Resource(name="assetService")
	private IAssetService assetService;
	
	@Test
	public void assetInsert() {
		
		AssetVo assetVo = new AssetVo();
		Date date1 = new Date();
	
		
		assetVo.setAssetCode("4444");
		assetVo.setAssetName("지게차");
		assetVo.setAcquisitionDate(date1);
		assetVo.setAccountName("1");
		assetVo.setClientName("1");
		assetVo.setSanggakWay("1");
		assetVo.setAcquisitionPrice("5000");
		assetVo.setResidualvalue("22222");
		assetVo.setJukyo("메모");
		assetVo.setSanggakCode("1");
		assetVo.setDepreciation("1");
		assetVo.setPurchaseCode("1");
		assetVo.setAccumulated("1");
		
		int insert = assetService.updateAsset(assetVo);
		assertNotNull(insert);
	}
}
