using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineTraining.Model;
using CMS.PortalControls;
public partial class OnlineTraining_UserControl_TestControl : CMSAbstractWebPart
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var _context = new OnlineTraningDbContext();
        label.Text = _context.ModuleSettings.Count().ToString(); ;
    }
}