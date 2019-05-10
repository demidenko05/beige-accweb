/*
BSD 2-Clause License

Copyright (c) 2019, Beigesoft™
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package org.beigesoft.war;

import java.util.Map;
import java.sql.ResultSet;

import org.beigesoft.fct.IFctAsm;
import org.beigesoft.fct.FctBlc;
import org.beigesoft.fct.FctDbCp;
import org.beigesoft.hld.IAttrs;
import org.beigesoft.rdb.Orm;
import org.beigesoft.web.FctMail;
import org.beigesoft.jdbc.FctPostgr;

/**
 * <p>Final configuration factory for Postgres JDBC.</p>
 *
 * @author Yury Demidenko
 */
public class FctAppPstg implements IFctAsm<ResultSet> {

  /**
   * <p>Main only factory.</p>
   **/
  private FctBlc<ResultSet> fctBlc;

  /**
   * <p>Only constructor.</p>
   * @throws Exception - an exception
   */
  public FctAppPstg() throws Exception {
    this.fctBlc = new FctBlc<ResultSet>();
    this.fctBlc.getFctsAux().add(new FctPostgr());
    this.fctBlc.getFctsAux().add(new FctDbCp<ResultSet>());
    this.fctBlc.getFctsAux().add(new FctMail<ResultSet>());
  }

  /**
   * <p>Get bean in lazy mode (if bean is null then initialize it).</p>
   * @param pRqVs request scoped vars
   * @param pBnNm - bean name
   * @return Object - requested bean or exception if not found
   * @throws Exception - an exception
   */
  @Override
  public final Object laz(final Map<String, Object> pRqVs,
    final String pBnNm) throws Exception {
    return this.fctBlc.laz(pRqVs, pBnNm);
  }

  /**
   * <p>Releases memory.</p>
   * @param pRqVs request scoped vars
   * @throws Exception - an exception
   */
  @Override
  public final void release(final Map<String, Object> pRqVs) throws Exception {
    this.fctBlc.release(pRqVs);
  }


  /**
   * <p>Puts beans by external AUX factory.</p>
   * @param pRqVs request scoped vars
   * @param pBnNm - bean name
   * @param pBean - bean
   * @throws Exception - an exception, e.g. if bean exists
   **/
  @Override
  public final void put(final Map<String, Object> pRqVs,
    final String pBnNm, final Object pBean) throws Exception {
    this.fctBlc.put(pRqVs, pBnNm, pBean);
  }

  /**
   * <p>Gets main factory for setting configuration parameters.</p>
   * @return Object - requested bean
   */
  @Override
  public final FctBlc<ResultSet> getFctBlc() {
    return this.fctBlc;
  }

  /**
   * <p>Initializes factory.</p>
   * @param pRvs request scoped vars
   * @param pCtxAttrs context attributes
   * @throws Exception - an exception, e.g. if bean exists
   */
  @Override
  public final void init(final Map<String, Object> pRvs,
    final IAttrs pCtxAttrs) throws Exception {
    //creating/upgrading DB on start:
    Orm<ResultSet> orm = this.fctBlc.lazOrm(pRvs);
    orm.init(pRvs);
      //free memory:
    orm.getSetng().release();
  }
}
