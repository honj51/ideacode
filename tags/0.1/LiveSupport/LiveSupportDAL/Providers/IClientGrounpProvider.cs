using System;
using System.Collections.Generic;
using System.Text;
using LiveSupport.LiveSupportModel;

namespace LiveSupport.Providers
{
    public interface IClientGrounpProvider
    {
        int AddClientGrounp(ClientGrounp cg);
        ClientGrounp CheckClientGrounpByAccountIdAndGrountpName(string accountId, string GrountpName);
        ClientGrounp GetClientGrounpById(string grounpId);
        int UpdateClientGrounp(ClientGrounp cg);
        List<ClientGrounp> GetClientGrounpByAccountId(string accountId);
    }
}
