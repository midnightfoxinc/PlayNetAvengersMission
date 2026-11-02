using System;
using System.Collections.Generic;
using System.IO;
using Prime31;
using UnityEngine;

// Token: 0x02000008 RID: 8
public class EtceteraAndroidManager : AbstractManager
{
	// Token: 0x0600003A RID: 58 RVA: 0x00002E08 File Offset: 0x00001008
	static EtceteraAndroidManager()
	{
		AbstractManager.initialize(typeof(EtceteraAndroidManager));
	}

	// Token: 0x14000001 RID: 1
	// (add) Token: 0x0600003B RID: 59 RVA: 0x00002E1C File Offset: 0x0000101C
	// (remove) Token: 0x0600003C RID: 60 RVA: 0x00002E34 File Offset: 0x00001034
	public static event Action<string> alertButtonClickedEvent;

	// Token: 0x14000002 RID: 2
	// (add) Token: 0x0600003D RID: 61 RVA: 0x00002E4C File Offset: 0x0000104C
	// (remove) Token: 0x0600003E RID: 62 RVA: 0x00002E64 File Offset: 0x00001064
	public static event Action alertCancelledEvent;

	// Token: 0x14000003 RID: 3
	// (add) Token: 0x0600003F RID: 63 RVA: 0x00002E7C File Offset: 0x0000107C
	// (remove) Token: 0x06000040 RID: 64 RVA: 0x00002E94 File Offset: 0x00001094
	public static event Action<string> promptFinishedWithTextEvent;

	// Token: 0x14000004 RID: 4
	// (add) Token: 0x06000041 RID: 65 RVA: 0x00002EAC File Offset: 0x000010AC
	// (remove) Token: 0x06000042 RID: 66 RVA: 0x00002EC4 File Offset: 0x000010C4
	public static event Action promptCancelledEvent;

	// Token: 0x14000005 RID: 5
	// (add) Token: 0x06000043 RID: 67 RVA: 0x00002EDC File Offset: 0x000010DC
	// (remove) Token: 0x06000044 RID: 68 RVA: 0x00002EF4 File Offset: 0x000010F4
	public static event Action<string, string> twoFieldPromptFinishedWithTextEvent;

	// Token: 0x14000006 RID: 6
	// (add) Token: 0x06000045 RID: 69 RVA: 0x00002F0C File Offset: 0x0000110C
	// (remove) Token: 0x06000046 RID: 70 RVA: 0x00002F24 File Offset: 0x00001124
	public static event Action twoFieldPromptCancelledEvent;

	// Token: 0x14000007 RID: 7
	// (add) Token: 0x06000047 RID: 71 RVA: 0x00002F3C File Offset: 0x0000113C
	// (remove) Token: 0x06000048 RID: 72 RVA: 0x00002F54 File Offset: 0x00001154
	public static event Action webViewCancelledEvent;

	// Token: 0x14000008 RID: 8
	// (add) Token: 0x06000049 RID: 73 RVA: 0x00002F6C File Offset: 0x0000116C
	// (remove) Token: 0x0600004A RID: 74 RVA: 0x00002F84 File Offset: 0x00001184
	public static event Action albumChooserCancelledEvent;

	// Token: 0x14000009 RID: 9
	// (add) Token: 0x0600004B RID: 75 RVA: 0x00002F9C File Offset: 0x0000119C
	// (remove) Token: 0x0600004C RID: 76 RVA: 0x00002FB4 File Offset: 0x000011B4
	public static event Action<string> albumChooserSucceededEvent;

	// Token: 0x1400000A RID: 10
	// (add) Token: 0x0600004D RID: 77 RVA: 0x00002FCC File Offset: 0x000011CC
	// (remove) Token: 0x0600004E RID: 78 RVA: 0x00002FE4 File Offset: 0x000011E4
	public static event Action photoChooserCancelledEvent;

	// Token: 0x1400000B RID: 11
	// (add) Token: 0x0600004F RID: 79 RVA: 0x00002FFC File Offset: 0x000011FC
	// (remove) Token: 0x06000050 RID: 80 RVA: 0x00003014 File Offset: 0x00001214
	public static event Action<string> photoChooserSucceededEvent;

	// Token: 0x1400000C RID: 12
	// (add) Token: 0x06000051 RID: 81 RVA: 0x0000302C File Offset: 0x0000122C
	// (remove) Token: 0x06000052 RID: 82 RVA: 0x00003044 File Offset: 0x00001244
	public static event Action<string> videoRecordingSucceededEvent;

	// Token: 0x1400000D RID: 13
	// (add) Token: 0x06000053 RID: 83 RVA: 0x0000305C File Offset: 0x0000125C
	// (remove) Token: 0x06000054 RID: 84 RVA: 0x00003074 File Offset: 0x00001274
	public static event Action videoRecordingCancelledEvent;

	// Token: 0x1400000E RID: 14
	// (add) Token: 0x06000055 RID: 85 RVA: 0x0000308C File Offset: 0x0000128C
	// (remove) Token: 0x06000056 RID: 86 RVA: 0x000030A4 File Offset: 0x000012A4
	public static event Action ttsInitializedEvent;

	// Token: 0x1400000F RID: 15
	// (add) Token: 0x06000057 RID: 87 RVA: 0x000030BC File Offset: 0x000012BC
	// (remove) Token: 0x06000058 RID: 88 RVA: 0x000030D4 File Offset: 0x000012D4
	public static event Action ttsFailedToInitializeEvent;

	// Token: 0x14000010 RID: 16
	// (add) Token: 0x06000059 RID: 89 RVA: 0x000030EC File Offset: 0x000012EC
	// (remove) Token: 0x0600005A RID: 90 RVA: 0x00003104 File Offset: 0x00001304
	public static event Action askForReviewWillOpenMarketEvent;

	// Token: 0x14000011 RID: 17
	// (add) Token: 0x0600005B RID: 91 RVA: 0x0000311C File Offset: 0x0000131C
	// (remove) Token: 0x0600005C RID: 92 RVA: 0x00003134 File Offset: 0x00001334
	public static event Action askForReviewRemindMeLaterEvent;

	// Token: 0x14000012 RID: 18
	// (add) Token: 0x0600005D RID: 93 RVA: 0x0000314C File Offset: 0x0000134C
	// (remove) Token: 0x0600005E RID: 94 RVA: 0x00003164 File Offset: 0x00001364
	public static event Action askForReviewDontAskAgainEvent;

	// Token: 0x14000013 RID: 19
	// (add) Token: 0x0600005F RID: 95 RVA: 0x0000317C File Offset: 0x0000137C
	// (remove) Token: 0x06000060 RID: 96 RVA: 0x00003194 File Offset: 0x00001394
	public static event Action<string> inlineWebViewJSCallbackEvent;

	// Token: 0x14000014 RID: 20
	// (add) Token: 0x06000061 RID: 97 RVA: 0x000031AC File Offset: 0x000013AC
	// (remove) Token: 0x06000062 RID: 98 RVA: 0x000031C4 File Offset: 0x000013C4
	public static event Action<string> notificationReceivedEvent;

	// Token: 0x14000015 RID: 21
	// (add) Token: 0x06000063 RID: 99 RVA: 0x000031DC File Offset: 0x000013DC
	// (remove) Token: 0x06000064 RID: 100 RVA: 0x000031F4 File Offset: 0x000013F4
	public static event Action<List<EtceteraAndroid.Contact>> contactsLoadedEvent;

	// Token: 0x06000065 RID: 101 RVA: 0x0000320C File Offset: 0x0000140C
	public void alertButtonClicked(string positiveButton)
	{
		if (EtceteraAndroidManager.alertButtonClickedEvent != null)
		{
			EtceteraAndroidManager.alertButtonClickedEvent.Invoke(positiveButton);
		}
	}

	// Token: 0x06000066 RID: 102 RVA: 0x00003224 File Offset: 0x00001424
	public void alertCancelled(string empty)
	{
		if (EtceteraAndroidManager.alertCancelledEvent != null)
		{
			EtceteraAndroidManager.alertCancelledEvent.Invoke();
		}
	}

	// Token: 0x06000067 RID: 103 RVA: 0x0000323C File Offset: 0x0000143C
	public void promptFinishedWithText(string text)
	{
		string[] array = text.Split(new string[]
		{
			"|||"
		}, 0);
		if (array.Length == 1 && EtceteraAndroidManager.promptFinishedWithTextEvent != null)
		{
			EtceteraAndroidManager.promptFinishedWithTextEvent.Invoke(array[0]);
		}
		if (array.Length == 2 && EtceteraAndroidManager.twoFieldPromptFinishedWithTextEvent != null)
		{
			EtceteraAndroidManager.twoFieldPromptFinishedWithTextEvent.Invoke(array[0], array[1]);
		}
	}

	// Token: 0x06000068 RID: 104 RVA: 0x000032A4 File Offset: 0x000014A4
	public void promptCancelled(string empty)
	{
		if (EtceteraAndroidManager.promptCancelledEvent != null)
		{
			EtceteraAndroidManager.promptCancelledEvent.Invoke();
		}
	}

	// Token: 0x06000069 RID: 105 RVA: 0x000032BC File Offset: 0x000014BC
	public void twoFieldPromptCancelled(string empty)
	{
		if (EtceteraAndroidManager.twoFieldPromptCancelledEvent != null)
		{
			EtceteraAndroidManager.twoFieldPromptCancelledEvent.Invoke();
		}
	}

	// Token: 0x0600006A RID: 106 RVA: 0x000032D4 File Offset: 0x000014D4
	public void webViewCancelled(string empty)
	{
		if (EtceteraAndroidManager.webViewCancelledEvent != null)
		{
			EtceteraAndroidManager.webViewCancelledEvent.Invoke();
		}
	}

	// Token: 0x0600006B RID: 107 RVA: 0x000032EC File Offset: 0x000014EC
	public void albumChooserCancelled(string empty)
	{
		if (EtceteraAndroidManager.albumChooserCancelledEvent != null)
		{
			EtceteraAndroidManager.albumChooserCancelledEvent.Invoke();
		}
	}

	// Token: 0x0600006C RID: 108 RVA: 0x00003304 File Offset: 0x00001504
	public void albumChooserSucceeded(string path)
	{
		if (EtceteraAndroidManager.albumChooserSucceededEvent != null)
		{
			if (File.Exists(path))
			{
				EtceteraAndroidManager.albumChooserSucceededEvent.Invoke(path);
			}
			else if (EtceteraAndroidManager.albumChooserCancelledEvent != null)
			{
				EtceteraAndroidManager.albumChooserCancelledEvent.Invoke();
			}
		}
	}

	// Token: 0x0600006D RID: 109 RVA: 0x00003340 File Offset: 0x00001540
	public void photoChooserCancelled(string empty)
	{
		if (EtceteraAndroidManager.photoChooserCancelledEvent != null)
		{
			EtceteraAndroidManager.photoChooserCancelledEvent.Invoke();
		}
	}

	// Token: 0x0600006E RID: 110 RVA: 0x00003358 File Offset: 0x00001558
	public void photoChooserSucceeded(string path)
	{
		if (EtceteraAndroidManager.photoChooserSucceededEvent != null)
		{
			if (File.Exists(path))
			{
				EtceteraAndroidManager.photoChooserSucceededEvent.Invoke(path);
			}
			else if (EtceteraAndroidManager.photoChooserCancelledEvent != null)
			{
				EtceteraAndroidManager.photoChooserCancelledEvent.Invoke();
			}
		}
	}

	// Token: 0x0600006F RID: 111 RVA: 0x00003394 File Offset: 0x00001594
	public void videoRecordingSucceeded(string path)
	{
		if (EtceteraAndroidManager.videoRecordingSucceededEvent != null)
		{
			EtceteraAndroidManager.videoRecordingSucceededEvent.Invoke(path);
		}
	}

	// Token: 0x06000070 RID: 112 RVA: 0x000033AC File Offset: 0x000015AC
	public void videoRecordingCancelled(string empty)
	{
		if (EtceteraAndroidManager.videoRecordingCancelledEvent != null)
		{
			EtceteraAndroidManager.videoRecordingCancelledEvent.Invoke();
		}
	}

	// Token: 0x06000071 RID: 113 RVA: 0x000033C4 File Offset: 0x000015C4
	public void ttsInitialized(string result)
	{
		bool flag = result == "1";
		if (flag && EtceteraAndroidManager.ttsInitializedEvent != null)
		{
			EtceteraAndroidManager.ttsInitializedEvent.Invoke();
		}
		if (!flag && EtceteraAndroidManager.ttsFailedToInitializeEvent != null)
		{
			EtceteraAndroidManager.ttsFailedToInitializeEvent.Invoke();
		}
	}

	// Token: 0x06000072 RID: 114 RVA: 0x00003414 File Offset: 0x00001614
	public void ttsUtteranceCompleted(string utteranceId)
	{
		Debug.Log("utterance completed: " + utteranceId);
	}

	// Token: 0x06000073 RID: 115 RVA: 0x00003428 File Offset: 0x00001628
	public void askForReviewWillOpenMarket(string empty)
	{
		if (EtceteraAndroidManager.askForReviewWillOpenMarketEvent != null)
		{
			EtceteraAndroidManager.askForReviewWillOpenMarketEvent.Invoke();
		}
	}

	// Token: 0x06000074 RID: 116 RVA: 0x00003440 File Offset: 0x00001640
	public void askForReviewRemindMeLater(string empty)
	{
		if (EtceteraAndroidManager.askForReviewRemindMeLaterEvent != null)
		{
			EtceteraAndroidManager.askForReviewRemindMeLaterEvent.Invoke();
		}
	}

	// Token: 0x06000075 RID: 117 RVA: 0x00003458 File Offset: 0x00001658
	public void askForReviewDontAskAgain(string empty)
	{
		if (EtceteraAndroidManager.askForReviewDontAskAgainEvent != null)
		{
			EtceteraAndroidManager.askForReviewDontAskAgainEvent.Invoke();
		}
	}

	// Token: 0x06000076 RID: 118 RVA: 0x00003470 File Offset: 0x00001670
	public void inlineWebViewJSCallback(string message)
	{
		ActionExtensions.fire<string>(EtceteraAndroidManager.inlineWebViewJSCallbackEvent, message);
	}

	// Token: 0x06000077 RID: 119 RVA: 0x00003480 File Offset: 0x00001680
	public void notificationReceived(string extraData)
	{
		ActionExtensions.fire<string>(EtceteraAndroidManager.notificationReceivedEvent, extraData);
	}

	// Token: 0x06000078 RID: 120 RVA: 0x00003490 File Offset: 0x00001690
	private void contactsLoaded(string json)
	{
		if (EtceteraAndroidManager.contactsLoadedEvent != null)
		{
			List<EtceteraAndroid.Contact> list = Json.decode<List<EtceteraAndroid.Contact>>(json, null);
			EtceteraAndroidManager.contactsLoadedEvent.Invoke(list);
		}
	}
}
