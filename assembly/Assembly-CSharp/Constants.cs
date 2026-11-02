using System;
using UnityEngine;

// Token: 0x0200016A RID: 362
public static class Constants
{
	// Token: 0x06000BD0 RID: 3024 RVA: 0x00056BFC File Offset: 0x00054DFC
	public static Constants.MissionMedal stringToMedal(string inval)
	{
		if (string.IsNullOrEmpty(inval))
		{
			return Constants.MissionMedal.MEDAL_NONE;
		}
		string text = inval.ToUpper();
		if (text.Equals("GOLD"))
		{
			return Constants.MissionMedal.MEDAL_GOLD;
		}
		if (text.Equals("SILVER"))
		{
			return Constants.MissionMedal.MEDAL_SILVER;
		}
		if (text.Equals("BRONZE"))
		{
			return Constants.MissionMedal.MEDAL_BRONZE;
		}
		return Constants.MissionMedal.MEDAL_NONE;
	}

	// Token: 0x06000BD1 RID: 3025 RVA: 0x00056C54 File Offset: 0x00054E54
	public static Constants.MissionMedal resNumToMedal(int inval)
	{
		switch (inval)
		{
		case 0:
			return Constants.MissionMedal.MEDAL_BRONZE;
		case 1:
			return Constants.MissionMedal.MEDAL_SILVER;
		case 2:
			return Constants.MissionMedal.MEDAL_GOLD;
		default:
			return Constants.MissionMedal.MEDAL_NONE;
		}
	}

	// Token: 0x06000BD2 RID: 3026 RVA: 0x00056C84 File Offset: 0x00054E84
	public static void resizeConstants()
	{
	}

	// Token: 0x04000B32 RID: 2866
	public const int INTEL_CRATE_STACK_ID = 1;

	// Token: 0x04000B33 RID: 2867
	public const ushort CONTENT_DATA_PUSH = 64020;

	// Token: 0x04000B34 RID: 2868
	public const ushort CONTENT_DATA_QUERY = 64021;

	// Token: 0x04000B35 RID: 2869
	public const int PackageEventID = 9015;

	// Token: 0x04000B36 RID: 2870
	public static GUIStyle blankStyle = new GUIStyle();

	// Token: 0x04000B37 RID: 2871
	public static int UIButtonWidth = 286;

	// Token: 0x04000B38 RID: 2872
	public static int UIButtonHeight = 70;

	// Token: 0x04000B39 RID: 2873
	public static int CloseBtnWidth = 91;

	// Token: 0x04000B3A RID: 2874
	public static int CloseBtnHeight = 91;

	// Token: 0x04000B3B RID: 2875
	public static int TextFieldWidth = 392;

	// Token: 0x04000B3C RID: 2876
	public static int TextFieldHeight = 50;

	// Token: 0x04000B3D RID: 2877
	public static int ToggleWidth = 49;

	// Token: 0x04000B3E RID: 2878
	public static int ToggleHeight = 53;

	// Token: 0x04000B3F RID: 2879
	public static int CUSTOM_ABILITY_OFFSET = 1000;

	// Token: 0x0200016B RID: 363
	public enum PopupWindows
	{
		// Token: 0x04000B41 RID: 2881
		LOGIN_POPUP_ID = 2,
		// Token: 0x04000B42 RID: 2882
		SETTINGS_POPUP_ID,
		// Token: 0x04000B43 RID: 2883
		FUZZ_POPUP_ID,
		// Token: 0x04000B44 RID: 2884
		NAME_SUPERHERO_POPUP_ID,
		// Token: 0x04000B45 RID: 2885
		ALERT_POPUP_ID
	}

	// Token: 0x0200016C RID: 364
	public enum ToyDataType
	{
		// Token: 0x04000B47 RID: 2887
		CT_MASTER = 1,
		// Token: 0x04000B48 RID: 2888
		CT_DEV_LIST,
		// Token: 0x04000B49 RID: 2889
		CT_ABIL_LIST,
		// Token: 0x04000B4A RID: 2890
		CT_ENV_LIST,
		// Token: 0x04000B4B RID: 2891
		CT_SCN_LIST,
		// Token: 0x04000B4C RID: 2892
		CT_ENV_CUR,
		// Token: 0x04000B4D RID: 2893
		CT_GAME_EVT,
		// Token: 0x04000B4E RID: 2894
		CT_PLAYER_DATA,
		// Token: 0x04000B4F RID: 2895
		CT_PLAY_RESULT,
		// Token: 0x04000B50 RID: 2896
		CT_ENEMY_INFO,
		// Token: 0x04000B51 RID: 2897
		CT_ABIL_PREV
	}

	// Token: 0x0200016D RID: 365
	public enum PlaymationDeviceType
	{
		// Token: 0x04000B53 RID: 2899
		DEVICE_APP = -3,
		// Token: 0x04000B54 RID: 2900
		DEVICE_UNKNOWN = 0,
		// Token: 0x04000B55 RID: 2901
		DEVICE_BOT = 1101,
		// Token: 0x04000B56 RID: 2902
		ACTION_DISK = 1201,
		// Token: 0x04000B57 RID: 2903
		DEVICE_AMBIENT = 2201,
		// Token: 0x04000B58 RID: 2904
		DEVICE_REPULSOR = 2101,
		// Token: 0x04000B59 RID: 2905
		DEVICE_HULKHAND = 2111
	}

	// Token: 0x0200016E RID: 366
	public enum PlaymationDeviceClass
	{
		// Token: 0x04000B5B RID: 2907
		DCLASS_BOT = 11,
		// Token: 0x04000B5C RID: 2908
		DCLASS_AD,
		// Token: 0x04000B5D RID: 2909
		DCLASS_HERO = 21,
		// Token: 0x04000B5E RID: 2910
		DCLASS_AMBIENT
	}

	// Token: 0x0200016F RID: 367
	public enum SyncEvent
	{
		// Token: 0x04000B60 RID: 2912
		SYNC_APP_INITIATE = 5514,
		// Token: 0x04000B61 RID: 2913
		SYNC_APP_PROMPT,
		// Token: 0x04000B62 RID: 2914
		SYNC_APP_PROMPT_FAIL,
		// Token: 0x04000B63 RID: 2915
		SYNC_APP_CONFIRM,
		// Token: 0x04000B64 RID: 2916
		SYNC_UNUSED,
		// Token: 0x04000B65 RID: 2917
		SYNC_APP_SUCCESS,
		// Token: 0x04000B66 RID: 2918
		SYNC_APP_FAIL,
		// Token: 0x04000B67 RID: 2919
		SYNC_SET_MASKED_KEY = 5505,
		// Token: 0x04000B68 RID: 2920
		SYNC_APP_WRONG_CODE = 5527
	}

	// Token: 0x02000170 RID: 368
	public enum RegistrationEvent
	{
		// Token: 0x04000B6A RID: 2922
		REG_TOKEN_TO_MOLA = 1,
		// Token: 0x04000B6B RID: 2923
		REG_TOKEN_FROM_MOLA,
		// Token: 0x04000B6C RID: 2924
		REG_TOKEN_VERIFIED,
		// Token: 0x04000B6D RID: 2925
		REG_FAIL_GENERAL = 80,
		// Token: 0x04000B6E RID: 2926
		REG_FAIL_DECRYPTION = 83,
		// Token: 0x04000B6F RID: 2927
		REG_FAIL_ALREADY_REGISTERED,
		// Token: 0x04000B70 RID: 2928
		UNREG_FROM_RTO_SUCCESS = 10,
		// Token: 0x04000B71 RID: 2929
		UNREG_FROM_RTO_FAILURE = 90
	}

	// Token: 0x02000171 RID: 369
	public enum PackageEvent
	{
		// Token: 0x04000B73 RID: 2931
		SUCCESS,
		// Token: 0x04000B74 RID: 2932
		MANIFEST_FAILURE,
		// Token: 0x04000B75 RID: 2933
		VALIDATION_FAILURE,
		// Token: 0x04000B76 RID: 2934
		PREINSTALL_FAILURE,
		// Token: 0x04000B77 RID: 2935
		CONTENT_MISMATCH_FAILURE
	}

	// Token: 0x02000172 RID: 370
	public enum PlaymationDeviceGenus
	{
		// Token: 0x04000B79 RID: 2937
		NORA = 1,
		// Token: 0x04000B7A RID: 2938
		MOLA
	}

	// Token: 0x02000173 RID: 371
	public enum FirmwareEvent
	{
		// Token: 0x04000B7C RID: 2940
		FW_AVAILABLE = 101,
		// Token: 0x04000B7D RID: 2941
		FW_RECEIVED,
		// Token: 0x04000B7E RID: 2942
		FW_UPLOAD_STATUS,
		// Token: 0x04000B7F RID: 2943
		FW_CURRENT,
		// Token: 0x04000B80 RID: 2944
		FW_METADATA_ERROR,
		// Token: 0x04000B81 RID: 2945
		FW_RECEIVED_ERROR
	}

	// Token: 0x02000174 RID: 372
	public enum MissionMedal
	{
		// Token: 0x04000B83 RID: 2947
		MEDAL_NONE,
		// Token: 0x04000B84 RID: 2948
		MEDAL_BRONZE,
		// Token: 0x04000B85 RID: 2949
		MEDAL_SILVER,
		// Token: 0x04000B86 RID: 2950
		MEDAL_GOLD
	}

	// Token: 0x02000175 RID: 373
	public enum TutorialStep
	{
		// Token: 0x04000B88 RID: 2952
		COMPLETE = -1,
		// Token: 0x04000B89 RID: 2953
		MAIN_LOBBY_INTRO,
		// Token: 0x04000B8A RID: 2954
		MISSION_CONTROL,
		// Token: 0x04000B8B RID: 2955
		DRONE_GAME,
		// Token: 0x04000B8C RID: 2956
		MISSION_CONTROL_AFTER_GAME
	}

	// Token: 0x02000176 RID: 374
	public enum ContentDownLoadState
	{
		// Token: 0x04000B8E RID: 2958
		NULL,
		// Token: 0x04000B8F RID: 2959
		FETCHCONTENTLIST,
		// Token: 0x04000B90 RID: 2960
		FETCHMANIFEST,
		// Token: 0x04000B91 RID: 2961
		FETCHCONTENT
	}

	// Token: 0x02000177 RID: 375
	public enum FirmwareDownLoadState
	{
		// Token: 0x04000B93 RID: 2963
		NULL,
		// Token: 0x04000B94 RID: 2964
		FETCHMANIFEST,
		// Token: 0x04000B95 RID: 2965
		FETCHFIRMWARE
	}

	// Token: 0x02000178 RID: 376
	public enum PackageTransferState
	{
		// Token: 0x04000B97 RID: 2967
		PACKAGE_TRANSFER_COMPLETE = 9002,
		// Token: 0x04000B98 RID: 2968
		NEW_PACKAGE_AVAILABLE,
		// Token: 0x04000B99 RID: 2969
		DELETE_PACKAGE,
		// Token: 0x04000B9A RID: 2970
		DELETE_PACKAGE_RESPONSE,
		// Token: 0x04000B9B RID: 2971
		FILE_TRANSFER_REQUEST,
		// Token: 0x04000B9C RID: 2972
		FILE_NOT_FOUND,
		// Token: 0x04000B9D RID: 2973
		PACKAGE_QUERY,
		// Token: 0x04000B9E RID: 2974
		PACKAGES_PRESENT,
		// Token: 0x04000B9F RID: 2975
		REMAINING_SPACE_QUERY,
		// Token: 0x04000BA0 RID: 2976
		REMAINING_SPACE,
		// Token: 0x04000BA1 RID: 2977
		PACKAGE_TRANSFER_START,
		// Token: 0x04000BA2 RID: 2978
		PACKAGE_TRANSFER_ACCEPT,
		// Token: 0x04000BA3 RID: 2979
		RESET_DOWNLOAD,
		// Token: 0x04000BA4 RID: 2980
		PACKAGE_TRANSFER_COMPLETE_RESPONSE,
		// Token: 0x04000BA5 RID: 2981
		PACKAGE_READY_FOR_INSTALL,
		// Token: 0x04000BA6 RID: 2982
		UPLOAD_QUERY,
		// Token: 0x04000BA7 RID: 2983
		FILES_TO_UPLOAD
	}
}
