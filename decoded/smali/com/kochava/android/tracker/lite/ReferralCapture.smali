.class public Lcom/kochava/android/tracker/lite/ReferralCapture;
.super Landroid/content/BroadcastReceiver;
.source "ReferralCapture.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "KochavaSDKLiteReferralCapture"

.field public static params:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/ReferralCapture;->params:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 60
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_0

    const-string v9, "KochavaSDKLiteReferralCapture"

    const-string v10, "Referral Capture received an intent:"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    :cond_0
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_1

    const-string v9, "KochavaSDKLiteReferralCapture"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "package:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", action:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :cond_1
    :try_start_0
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 71
    .local v1, "extras":Landroid/os/Bundle;
    if-eqz v1, :cond_2

    .line 73
    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :cond_2
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 85
    .local v7, "referralParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    const-string v10, "com.android.vending.INSTALL_REFERRER"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 87
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_3

    const-string v9, "KochavaSDKLiteReferralCapture"

    const-string v10, "intent not a referral"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .end local v1    # "extras":Landroid/os/Bundle;
    .end local v7    # "referralParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    :goto_0
    return-void

    .line 76
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0

    .line 92
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "extras":Landroid/os/Bundle;
    .restart local v7    # "referralParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    const-string v9, "referrer"

    invoke-virtual {p2, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 93
    .local v8, "referrer":Ljava/lang/String;
    if-eqz v8, :cond_5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_6

    .line 95
    :cond_5
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_3

    const-string v9, "KochavaSDKLiteReferralCapture"

    const-string v10, "referral intent empty"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 101
    :cond_6
    :try_start_1
    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v8

    .line 109
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_7

    const-string v9, "KochavaSDKLiteReferralCapture"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "referral string: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    :cond_7
    :try_start_2
    const-string v9, "&"

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 117
    .local v4, "params":[Ljava/lang/String;
    array-length v10, v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    const/4 v9, 0x0

    :goto_1
    if-lt v9, v10, :cond_9

    .line 133
    .end local v4    # "params":[Ljava/lang/String;
    :cond_8
    :goto_2
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 136
    .local v6, "referParams":Ljava/lang/String;
    const/4 v9, 0x1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v6, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    const-string v10, ", "

    const-string v11, "&"

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 137
    const-string v9, "="

    const-string v10, ":"

    invoke-virtual {v6, v9, v10}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 141
    const-string v9, "initPrefs"

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 142
    .local v5, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    const-string v10, "shimInitData"

    invoke-interface {v9, v10, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 145
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_3

    const-string v9, "KochavaSDKLiteReferralCapture"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Setting referral global string: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 103
    .end local v5    # "pref":Landroid/content/SharedPreferences;
    .end local v6    # "referParams":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 105
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_3

    const-string v9, "KochavaSDKLiteReferralCapture"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Error within ReferralCapture: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 117
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v4    # "params":[Ljava/lang/String;
    :cond_9
    :try_start_3
    aget-object v3, v4, v9

    .line 119
    .local v3, "param":Ljava/lang/String;
    const-string v11, "="

    invoke-virtual {v3, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 121
    .local v2, "pair":[Ljava/lang/String;
    array-length v11, v2

    const/4 v12, 0x1

    if-ne v11, v12, :cond_a

    .line 122
    const/4 v11, 0x0

    aget-object v11, v2, v11

    const-string v12, ""

    invoke-interface {v7, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 124
    :cond_a
    const/4 v11, 0x0

    aget-object v11, v2, v11

    const/4 v12, 0x1

    aget-object v12, v2, v12

    invoke-interface {v7, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    .line 127
    .end local v2    # "pair":[Ljava/lang/String;
    .end local v3    # "param":Ljava/lang/String;
    .end local v4    # "params":[Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 129
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v9, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v9, :cond_8

    const-string v9, "KochavaSDKLiteReferralCapture"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Error within ReferralCapture: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2
.end method
