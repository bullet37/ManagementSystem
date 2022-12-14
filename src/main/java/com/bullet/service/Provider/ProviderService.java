package com.bullet.service.Provider;

import com.bullet.pojo.Provider;
import java.util.List;

/**
 * @author Administrator
 * @Auther: bullet
 * @Description: com.bullet.service.Provider
 * @version: 1.0
 */
public interface ProviderService {
    /**
     * 通过供应商名称、编码获取供应商列表-模糊查询-providerList
     * @param proName
     * @return
     */
    public List<Provider> getProviderList(String proName, String proCode);
    /**
     * 增加供应商
     * @param provider
     * @return
     */
    public boolean add(Provider provider);
    /**
     * 通过proId删除Provider
     * @param delId
     * @return
     */
    public int deleteProviderById(String delId);
    /**
     * 修改供应商信息
     * @param provider
     * @return
     */
    public boolean modify(Provider provider);
    /**
     * 通过proId获取Provider
     * @param id
     * @return
     */
    public Provider getProviderById(String id);
}
