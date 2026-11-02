using System;
using System.Collections;

namespace emcore
{
	// Token: 0x02000265 RID: 613
	public class AppState
	{
		// Token: 0x060010A2 RID: 4258 RVA: 0x00076624 File Offset: 0x00074824
		public AppState(string sceneName)
		{
			this.mSceneName = sceneName;
		}

		// Token: 0x060010A3 RID: 4259 RVA: 0x00076640 File Offset: 0x00074840
		public void addTransition(string transitionName, AppState newState)
		{
			this.mStateTransitions.Add(transitionName, newState);
		}

		// Token: 0x060010A4 RID: 4260 RVA: 0x00076650 File Offset: 0x00074850
		public AppState getNextState(string transitionName)
		{
			if (!this.mStateTransitions.ContainsKey(transitionName))
			{
				return this;
			}
			return this.mStateTransitions[transitionName] as AppState;
		}

		// Token: 0x040010F4 RID: 4340
		public readonly string mSceneName;

		// Token: 0x040010F5 RID: 4341
		private Hashtable mStateTransitions = new Hashtable();
	}
}
