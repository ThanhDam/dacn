using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Web.Mvc;


namespace GiaiDapWeb.Areas.Adminitrator.Models
{
    public class ReflectionController
    {
        /*
         * Lấy danh sách các controller
         * 
         */
        public List<Type> GetControllers(string namespaces)
        {
            List<Type> listController= new List<Type>();
            Assembly assembly= Assembly.GetExecutingAssembly();
            IEnumerable<Type> types= assembly.GetTypes().Where(type=>typeof(Controller).IsAssignableFrom(type)&& type.Namespace.Contains(namespaces)).OrderBy(t=>t.Name);
            return types.ToList();
        }

        /**
         * Lấy danh sách các action theo controller
         */

        public List<string> GetActions(Type controller)
        {
            List<string> listAction=new List<string>();
            IEnumerable<MemberInfo> memberInfo= controller.GetMethods(BindingFlags.Instance |
            BindingFlags.DeclaredOnly | BindingFlags.Public).Where(a => !a.GetCustomAttributes(typeof(System.Runtime.CompilerServices.CompilerGeneratedAttribute),true).Any()).OrderBy(m=>m.Name);
            foreach(MemberInfo method in memberInfo)
            {
                if(method.ReflectedType.IsPublic && !method.IsDefined(typeof(NonActionAttribute)))
                {
                    listAction.Add(method.Name.ToString());
                }
            }
            return listAction;
        }
        
    }

}
