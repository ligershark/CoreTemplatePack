using System;
using System.Runtime.InteropServices;
using Microsoft.VisualStudio.Shell;

namespace CoreTemplatePack
{
    [PackageRegistration(UseManagedResourcesOnly = true)]
    [InstalledProductRegistration("#110", "#112", Vsix.Name, IconResourceID = 400)]
    [Guid("63b2059e-1711-455f-9d05-02ed4a439082")]
    public sealed class VSPackage : Package
    {
        protected override void Initialize()
        {
            base.Initialize();
        }
    }
}
