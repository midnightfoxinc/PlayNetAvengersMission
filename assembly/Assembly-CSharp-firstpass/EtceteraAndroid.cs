using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

// Token: 0x02000005 RID: 5
public class EtceteraAndroid
{
	// Token: 0x06000005 RID: 5 RVA: 0x000021E0 File Offset: 0x000003E0
	static EtceteraAndroid()
	{
		if (Application.platform != 11)
		{
			return;
		}
		using (AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.prime31.EtceteraPlugin"))
		{
			EtceteraAndroid._plugin = androidJavaClass.CallStatic<AndroidJavaObject>("instance", new object[0]);
		}
	}

	// Token: 0x06000006 RID: 6 RVA: 0x0000224C File Offset: 0x0000044C
	public static Texture2D textureFromFileAtPath(string filePath)
	{
		byte[] array = File.ReadAllBytes(filePath);
		Texture2D texture2D = new Texture2D(1, 1);
		texture2D.LoadImage(array);
		texture2D.Apply();
		Debug.Log(string.Concat(new object[]
		{
			"texture size: ",
			texture2D.width,
			"x",
			texture2D.height
		}));
		return texture2D;
	}

	// Token: 0x06000007 RID: 7 RVA: 0x000022B4 File Offset: 0x000004B4
	public static void setSystemUiVisibilityToLowProfile(bool useLowProfile)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("setSystemUiVisibilityToLowProfile", new object[]
		{
			useLowProfile
		});
	}

	// Token: 0x06000008 RID: 8 RVA: 0x000022E4 File Offset: 0x000004E4
	public static void playMovie(string pathOrUrl, uint bgColor, bool showControls, EtceteraAndroid.ScalingMode scalingMode, bool closeOnTouch)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("playMovie", new object[]
		{
			pathOrUrl,
			(int)bgColor,
			showControls,
			(int)scalingMode,
			closeOnTouch
		});
	}

	// Token: 0x06000009 RID: 9 RVA: 0x0000233C File Offset: 0x0000053C
	public static void setAlertDialogTheme(int theme)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("setAlertDialogTheme", new object[]
		{
			theme
		});
	}

	// Token: 0x0600000A RID: 10 RVA: 0x0000236C File Offset: 0x0000056C
	public static void showToast(string text, bool useShortDuration)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showToast", new object[]
		{
			text,
			useShortDuration
		});
	}

	// Token: 0x0600000B RID: 11 RVA: 0x000023A0 File Offset: 0x000005A0
	public static void showAlert(string title, string message, string positiveButton)
	{
		EtceteraAndroid.showAlert(title, message, positiveButton, string.Empty);
	}

	// Token: 0x0600000C RID: 12 RVA: 0x000023B0 File Offset: 0x000005B0
	public static void showAlert(string title, string message, string positiveButton, string negativeButton)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showAlert", new object[]
		{
			title,
			message,
			positiveButton,
			negativeButton
		});
	}

	// Token: 0x0600000D RID: 13 RVA: 0x000023F0 File Offset: 0x000005F0
	public static void showAlertPrompt(string title, string message, string promptHint, string promptText, string positiveButton, string negativeButton)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showAlertPrompt", new object[]
		{
			title,
			message,
			promptHint,
			promptText,
			positiveButton,
			negativeButton
		});
	}

	// Token: 0x0600000E RID: 14 RVA: 0x0000243C File Offset: 0x0000063C
	public static void showAlertPromptWithTwoFields(string title, string message, string promptHintOne, string promptTextOne, string promptHintTwo, string promptTextTwo, string positiveButton, string negativeButton)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showAlertPromptWithTwoFields", new object[]
		{
			title,
			message,
			promptHintOne,
			promptTextOne,
			promptHintTwo,
			promptTextTwo,
			positiveButton,
			negativeButton
		});
	}

	// Token: 0x0600000F RID: 15 RVA: 0x00002490 File Offset: 0x00000690
	public static void showProgressDialog(string title, string message)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showProgressDialog", new object[]
		{
			title,
			message
		});
	}

	// Token: 0x06000010 RID: 16 RVA: 0x000024C8 File Offset: 0x000006C8
	public static void hideProgressDialog()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("hideProgressDialog", new object[0]);
	}

	// Token: 0x06000011 RID: 17 RVA: 0x000024F8 File Offset: 0x000006F8
	public static void showWebView(string url)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showWebView", new object[]
		{
			url
		});
	}

	// Token: 0x06000012 RID: 18 RVA: 0x0000252C File Offset: 0x0000072C
	public static void showCustomWebView(string url, bool disableTitle, bool disableBackButton)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showCustomWebView", new object[]
		{
			url,
			disableTitle,
			disableBackButton
		});
	}

	// Token: 0x06000013 RID: 19 RVA: 0x00002574 File Offset: 0x00000774
	public static void showEmailComposer(string toAddress, string subject, string text, bool isHTML)
	{
		EtceteraAndroid.showEmailComposer(toAddress, subject, text, isHTML, string.Empty);
	}

	// Token: 0x06000014 RID: 20 RVA: 0x00002584 File Offset: 0x00000784
	public static void showEmailComposer(string toAddress, string subject, string text, bool isHTML, string attachmentFilePath)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("showEmailComposer", new object[]
		{
			toAddress,
			subject,
			text,
			isHTML,
			attachmentFilePath
		});
	}

	// Token: 0x06000015 RID: 21 RVA: 0x000025D0 File Offset: 0x000007D0
	public static bool isSMSComposerAvailable()
	{
		return Application.platform == 11 && EtceteraAndroid._plugin.Call<bool>("isSMSComposerAvailable", new object[0]);
	}

	// Token: 0x06000016 RID: 22 RVA: 0x000025F8 File Offset: 0x000007F8
	public static void showSMSComposer(string body)
	{
		EtceteraAndroid.showSMSComposer(body, null);
	}

	// Token: 0x06000017 RID: 23 RVA: 0x00002604 File Offset: 0x00000804
	public static void showSMSComposer(string body, string[] recipients)
	{
		if (Application.platform != 11)
		{
			return;
		}
		string text = string.Empty;
		if (recipients != null && recipients.Length > 0)
		{
			text = "smsto:";
			foreach (string text2 in recipients)
			{
				text = text + text2 + ";";
			}
		}
		EtceteraAndroid._plugin.Call("showSMSComposer", new object[]
		{
			text,
			body
		});
	}

	// Token: 0x06000018 RID: 24 RVA: 0x00002680 File Offset: 0x00000880
	public static void shareImageWithNativeShareIntent(string pathToImage, string chooserText)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("shareImageWithNativeShareIntent", new object[]
		{
			pathToImage,
			chooserText
		});
	}

	// Token: 0x06000019 RID: 25 RVA: 0x000026B8 File Offset: 0x000008B8
	public static void shareWithNativeShareIntent(string text, string subject, string chooserText, string pathToImage = null)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("shareWithNativeShareIntent", new object[]
		{
			text,
			subject,
			chooserText,
			pathToImage
		});
	}

	// Token: 0x0600001A RID: 26 RVA: 0x000026F8 File Offset: 0x000008F8
	public static void promptToTakePhoto(string name)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("promptToTakePhoto", new object[]
		{
			name
		});
	}

	// Token: 0x0600001B RID: 27 RVA: 0x0000272C File Offset: 0x0000092C
	public static void promptForPictureFromAlbum(string name)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("promptForPictureFromAlbum", new object[]
		{
			name
		});
	}

	// Token: 0x0600001C RID: 28 RVA: 0x00002760 File Offset: 0x00000960
	public static void promptToTakeVideo(string name)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("promptToTakeVideo", new object[]
		{
			name
		});
	}

	// Token: 0x0600001D RID: 29 RVA: 0x00002794 File Offset: 0x00000994
	public static bool saveImageToGallery(string pathToPhoto, string title)
	{
		return Application.platform == 11 && EtceteraAndroid._plugin.Call<bool>("saveImageToGallery", new object[]
		{
			pathToPhoto,
			title
		});
	}

	// Token: 0x0600001E RID: 30 RVA: 0x000027C4 File Offset: 0x000009C4
	public static void scaleImageAtPath(string pathToImage, float scale)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("scaleImageAtPath", new object[]
		{
			pathToImage,
			scale
		});
	}

	// Token: 0x0600001F RID: 31 RVA: 0x000027F8 File Offset: 0x000009F8
	public static Vector2 getImageSizeAtPath(string pathToImage)
	{
		if (Application.platform != 11)
		{
			return Vector2.zero;
		}
		string text = EtceteraAndroid._plugin.Call<string>("getImageSizeAtPath", new object[]
		{
			pathToImage
		});
		string[] array = text.Split(new char[]
		{
			','
		});
		return new Vector2((float)int.Parse(array[0]), (float)int.Parse(array[1]));
	}

	// Token: 0x06000020 RID: 32 RVA: 0x0000285C File Offset: 0x00000A5C
	public static void enableImmersiveMode(bool shouldEnable)
	{
		if (Application.platform == 11)
		{
			EtceteraAndroid._plugin.Call("enableImmersiveMode", new object[]
			{
				(!shouldEnable) ? 0 : 1
			});
		}
	}

	// Token: 0x06000021 RID: 33 RVA: 0x000028A0 File Offset: 0x00000AA0
	public static void loadContacts(int startingIndex, int totalToRetrieve)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("loadContacts", new object[]
		{
			startingIndex,
			totalToRetrieve
		});
	}

	// Token: 0x06000022 RID: 34 RVA: 0x000028E4 File Offset: 0x00000AE4
	public static void initTTS()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("initTTS", new object[0]);
	}

	// Token: 0x06000023 RID: 35 RVA: 0x00002914 File Offset: 0x00000B14
	public static void teardownTTS()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("teardownTTS", new object[0]);
	}

	// Token: 0x06000024 RID: 36 RVA: 0x00002944 File Offset: 0x00000B44
	public static void speak(string text)
	{
		EtceteraAndroid.speak(text, TTSQueueMode.Add);
	}

	// Token: 0x06000025 RID: 37 RVA: 0x00002950 File Offset: 0x00000B50
	public static void speak(string text, TTSQueueMode queueMode)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("speak", new object[]
		{
			text,
			(int)queueMode
		});
	}

	// Token: 0x06000026 RID: 38 RVA: 0x00002984 File Offset: 0x00000B84
	public static void stop()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("stop", new object[0]);
	}

	// Token: 0x06000027 RID: 39 RVA: 0x000029B4 File Offset: 0x00000BB4
	public static void playSilence(long durationInMs, TTSQueueMode queueMode)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("playSilence", new object[]
		{
			durationInMs,
			(int)queueMode
		});
	}

	// Token: 0x06000028 RID: 40 RVA: 0x000029F8 File Offset: 0x00000BF8
	public static void setPitch(float pitch)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("setPitch", new object[]
		{
			pitch
		});
	}

	// Token: 0x06000029 RID: 41 RVA: 0x00002A28 File Offset: 0x00000C28
	public static void setSpeechRate(float rate)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("setSpeechRate", new object[]
		{
			rate
		});
	}

	// Token: 0x0600002A RID: 42 RVA: 0x00002A58 File Offset: 0x00000C58
	public static void askForReviewSetButtonTitles(string remindMeLaterTitle, string dontAskAgainTitle, string rateItTitle)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("askForReviewSetButtonTitles", new object[]
		{
			remindMeLaterTitle,
			dontAskAgainTitle,
			rateItTitle
		});
	}

	// Token: 0x0600002B RID: 43 RVA: 0x00002A94 File Offset: 0x00000C94
	public static void askForReview(int launchesUntilPrompt, int hoursUntilFirstPrompt, int hoursBetweenPrompts, string title, string message, bool isAmazonAppStore = false)
	{
		if (Application.platform != 11)
		{
			return;
		}
		if (isAmazonAppStore)
		{
			EtceteraAndroid._plugin.Set<bool>("isAmazonAppStore", true);
		}
		EtceteraAndroid._plugin.Call("askForReview", new object[]
		{
			launchesUntilPrompt,
			hoursUntilFirstPrompt,
			hoursBetweenPrompts,
			title,
			message
		});
	}

	// Token: 0x0600002C RID: 44 RVA: 0x00002B00 File Offset: 0x00000D00
	public static void askForReviewNow(string title, string message, bool isAmazonAppStore = false)
	{
		if (Application.platform != 11)
		{
			return;
		}
		if (isAmazonAppStore)
		{
			EtceteraAndroid._plugin.Set<bool>("isAmazonAppStore", true);
		}
		EtceteraAndroid._plugin.Call("askForReviewNow", new object[]
		{
			title,
			message
		});
	}

	// Token: 0x0600002D RID: 45 RVA: 0x00002B50 File Offset: 0x00000D50
	public static void resetAskForReview()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("resetAskForReview", new object[0]);
	}

	// Token: 0x0600002E RID: 46 RVA: 0x00002B80 File Offset: 0x00000D80
	public static void openReviewPageInPlayStore(bool isAmazonAppStore = false)
	{
		if (Application.platform != 11)
		{
			return;
		}
		if (isAmazonAppStore)
		{
			EtceteraAndroid._plugin.Set<bool>("isAmazonAppStore", true);
		}
		EtceteraAndroid._plugin.Call("openReviewPageInPlayStore", new object[0]);
	}

	// Token: 0x0600002F RID: 47 RVA: 0x00002BC8 File Offset: 0x00000DC8
	public static void inlineWebViewShow(string url, int x, int y, int width, int height)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("inlineWebViewShow", new object[]
		{
			url,
			x,
			y,
			width,
			height
		});
	}

	// Token: 0x06000030 RID: 48 RVA: 0x00002C20 File Offset: 0x00000E20
	public static void inlineWebViewClose()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("inlineWebViewClose", new object[0]);
	}

	// Token: 0x06000031 RID: 49 RVA: 0x00002C50 File Offset: 0x00000E50
	public static void inlineWebViewSetUrl(string url)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("inlineWebViewSetUrl", new object[]
		{
			url
		});
	}

	// Token: 0x06000032 RID: 50 RVA: 0x00002C84 File Offset: 0x00000E84
	public static void inlineWebViewSetFrame(int x, int y, int width, int height)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("inlineWebViewSetFrame", new object[]
		{
			x,
			y,
			width,
			height
		});
	}

	// Token: 0x06000033 RID: 51 RVA: 0x00002CD8 File Offset: 0x00000ED8
	public static int scheduleNotification(long secondsFromNow, string title, string subtitle, string tickerText, string extraData, int requestCode = -1)
	{
		return EtceteraAndroid.scheduleNotification(secondsFromNow, title, subtitle, tickerText, extraData, null, null, requestCode);
	}

	// Token: 0x06000034 RID: 52 RVA: 0x00002CF4 File Offset: 0x00000EF4
	public static int scheduleNotification(long secondsFromNow, string title, string subtitle, string tickerText, string extraData, string smallIcon, string largeIcon, int requestCode = -1)
	{
		if (Application.platform != 11)
		{
			return -1;
		}
		if (requestCode == -1)
		{
			requestCode = Random.Range(0, int.MaxValue);
		}
		return EtceteraAndroid._plugin.Call<int>("scheduleNotification", new object[]
		{
			secondsFromNow,
			title,
			subtitle,
			tickerText,
			extraData,
			smallIcon,
			largeIcon,
			requestCode
		});
	}

	// Token: 0x06000035 RID: 53 RVA: 0x00002D68 File Offset: 0x00000F68
	public static void cancelNotification(int notificationId)
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("cancelNotification", new object[]
		{
			notificationId
		});
	}

	// Token: 0x06000036 RID: 54 RVA: 0x00002D98 File Offset: 0x00000F98
	public static void cancelAllNotifications()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("cancelAllNotifications", new object[0]);
	}

	// Token: 0x06000037 RID: 55 RVA: 0x00002DC8 File Offset: 0x00000FC8
	public static void checkForNotifications()
	{
		if (Application.platform != 11)
		{
			return;
		}
		EtceteraAndroid._plugin.Call("checkForNotifications", new object[0]);
	}

	// Token: 0x04000004 RID: 4
	private static AndroidJavaObject _plugin;

	// Token: 0x02000006 RID: 6
	public enum ScalingMode
	{
		// Token: 0x04000006 RID: 6
		None,
		// Token: 0x04000007 RID: 7
		AspectFit,
		// Token: 0x04000008 RID: 8
		Fill
	}

	// Token: 0x02000007 RID: 7
	public class Contact
	{
		// Token: 0x04000009 RID: 9
		public string name;

		// Token: 0x0400000A RID: 10
		public List<string> emails;

		// Token: 0x0400000B RID: 11
		public List<string> phoneNumbers;
	}
}
