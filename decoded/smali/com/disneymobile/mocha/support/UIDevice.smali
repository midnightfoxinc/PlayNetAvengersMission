.class public final enum Lcom/disneymobile/mocha/support/UIDevice;
.super Ljava/lang/Enum;
.source "UIDevice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/support/UIDevice$1;,
        Lcom/disneymobile/mocha/support/UIDevice$ConnectivityBroadcastReceiver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/disneymobile/mocha/support/UIDevice;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/disneymobile/mocha/support/UIDevice;

.field public static final ChangedNotification:Ljava/lang/String; = "DMOReachabilityChangedNotification"

.field public static final CurrentStatusKey:Ljava/lang/String; = "currentStatus"

.field public static final PreviousStatusKey:Ljava/lang/String; = "previousStatus"

.field public static final enum currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

.field private static final kCCBlockSizeAES128:I = 0x10

.field private static final kCCKeySizeAES128:I = 0x10

.field private static receiver:Landroid/content/BroadcastReceiver;


# instance fields
.field private connectivityManager:Landroid/net/ConnectivityManager;

.field private encryptedID:Ljava/lang/String;

.field private macHash:Ljava/lang/String;

.field private previousNetworkStatus:Lcom/disneymobile/network/DMONetworkStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 35
    new-instance v0, Lcom/disneymobile/mocha/support/UIDevice;

    const-string v1, "currentDevice"

    invoke-direct {v0, v1, v2}, Lcom/disneymobile/mocha/support/UIDevice;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    .line 33
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/disneymobile/mocha/support/UIDevice;

    sget-object v1, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    aput-object v1, v0, v2

    sput-object v0, Lcom/disneymobile/mocha/support/UIDevice;->$VALUES:[Lcom/disneymobile/mocha/support/UIDevice;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 82
    iput-object v0, p0, Lcom/disneymobile/mocha/support/UIDevice;->encryptedID:Ljava/lang/String;

    .line 91
    iput-object v0, p0, Lcom/disneymobile/mocha/support/UIDevice;->macHash:Ljava/lang/String;

    .line 219
    return-void
.end method

.method static synthetic access$100(Lcom/disneymobile/mocha/support/UIDevice;)Lcom/disneymobile/network/DMONetworkStatus;
    .locals 1
    .param p0, "x0"    # Lcom/disneymobile/mocha/support/UIDevice;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/disneymobile/mocha/support/UIDevice;->previousNetworkStatus:Lcom/disneymobile/network/DMONetworkStatus;

    return-object v0
.end method

.method static synthetic access$102(Lcom/disneymobile/mocha/support/UIDevice;Lcom/disneymobile/network/DMONetworkStatus;)Lcom/disneymobile/network/DMONetworkStatus;
    .locals 0
    .param p0, "x0"    # Lcom/disneymobile/mocha/support/UIDevice;
    .param p1, "x1"    # Lcom/disneymobile/network/DMONetworkStatus;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/disneymobile/mocha/support/UIDevice;->previousNetworkStatus:Lcom/disneymobile/network/DMONetworkStatus;

    return-object p1
.end method

.method private encryptString(Ljava/lang/String;)Ljava/lang/String;
    .locals 25
    .param p1, "stringToEncrypt"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v19, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v19 .. v19}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 103
    .local v19, "uniqueIDBytes":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v20, Ljava/io/OutputStreamWriter;

    const-string v21, "UTF-8"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 104
    .local v20, "writer":Ljava/io/OutputStreamWriter;
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 105
    invoke-virtual/range {v20 .. v20}, Ljava/io/OutputStreamWriter;->flush()V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 113
    invoke-virtual/range {v19 .. v19}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v18

    .line 116
    .local v18, "uniqueIDAsData":[B
    move-object/from16 v0, v18

    array-length v10, v0

    .line 117
    .local v10, "memBlockSize":I
    rem-int/lit8 v21, v10, 0x10

    if-lez v21, :cond_0

    .line 118
    add-int/lit8 v21, v10, 0x10

    div-int/lit8 v21, v21, 0x10

    mul-int/lit8 v10, v21, 0x10

    .line 119
    :cond_0
    new-array v11, v10, [B

    .line 122
    .local v11, "paddedBuffer":[B
    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v23, v0

    move-object/from16 v0, v18

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-static {v0, v1, v11, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 128
    const/16 v16, 0x14

    .line 129
    .local v16, "saltPlusJunkSize":I
    const/16 v21, 0x14

    move/from16 v0, v21

    new-array v15, v0, [B

    fill-array-data v15, :array_0

    .line 130
    .local v15, "saltPlusJunk":[B
    const/16 v21, 0x10

    move/from16 v0, v21

    new-array v12, v0, [B

    .line 131
    .local v12, "salt":[B
    const/4 v13, 0x0

    .line 132
    .local v13, "saltIndex":I
    const/4 v9, 0x0

    .local v9, "junkIndex":I
    move v14, v13

    .end local v13    # "saltIndex":I
    .local v14, "saltIndex":I
    :goto_0
    const/16 v21, 0x14

    move/from16 v0, v21

    if-ge v9, v0, :cond_1

    .line 133
    const/16 v21, 0x1

    move/from16 v0, v21

    if-eq v9, v0, :cond_4

    const/16 v21, 0x4

    move/from16 v0, v21

    if-eq v9, v0, :cond_4

    const/16 v21, 0xb

    move/from16 v0, v21

    if-eq v9, v0, :cond_4

    const/16 v21, 0x13

    move/from16 v0, v21

    if-eq v9, v0, :cond_4

    .line 134
    add-int/lit8 v13, v14, 0x1

    .end local v14    # "saltIndex":I
    .restart local v13    # "saltIndex":I
    aget-byte v21, v15, v9

    aput-byte v21, v12, v14

    .line 132
    :goto_1
    add-int/lit8 v9, v9, 0x1

    move v14, v13

    .end local v13    # "saltIndex":I
    .restart local v14    # "saltIndex":I
    goto :goto_0

    .line 106
    .end local v9    # "junkIndex":I
    .end local v10    # "memBlockSize":I
    .end local v11    # "paddedBuffer":[B
    .end local v12    # "salt":[B
    .end local v14    # "saltIndex":I
    .end local v15    # "saltPlusJunk":[B
    .end local v16    # "saltPlusJunkSize":I
    .end local v18    # "uniqueIDAsData":[B
    .end local v20    # "writer":Ljava/io/OutputStreamWriter;
    :catch_0
    move-exception v5

    .line 107
    .local v5, "e":Ljava/io/UnsupportedEncodingException;
    const-string v21, "UIDevice"

    const-string v22, "IO System is reporting that UTF-8 is not supported.  This is unlikely."

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 108
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, "IO System is reporting that UTF-8 is not supported.  This is unlikely."

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 109
    .end local v5    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v5

    .line 110
    .local v5, "e":Ljava/io/IOException;
    const-string v21, "UIDevice"

    const-string v22, "Unable to write into the byte array"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 111
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, "Unable to write into the byte array"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 138
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v9    # "junkIndex":I
    .restart local v10    # "memBlockSize":I
    .restart local v11    # "paddedBuffer":[B
    .restart local v12    # "salt":[B
    .restart local v14    # "saltIndex":I
    .restart local v15    # "saltPlusJunk":[B
    .restart local v16    # "saltPlusJunkSize":I
    .restart local v18    # "uniqueIDAsData":[B
    .restart local v20    # "writer":Ljava/io/OutputStreamWriter;
    :cond_1
    new-instance v17, Ljavax/crypto/spec/SecretKeySpec;

    const-string v21, "AES"

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-direct {v0, v12, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 142
    .local v17, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :try_start_1
    const-string v21, "AES/ECB/NoPadding"

    invoke-static/range {v21 .. v21}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v4

    .line 143
    .local v4, "cipher":Ljavax/crypto/Cipher;
    const/16 v21, 0x1

    move/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v4, v0, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 144
    invoke-virtual {v4, v11}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_6

    move-result-object v6

    .line 162
    .local v6, "encrypted":[B
    if-eqz v6, :cond_3

    array-length v0, v6

    move/from16 v21, v0

    if-lez v21, :cond_3

    .line 164
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .local v7, "hexString":Ljava/lang/StringBuilder;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    array-length v0, v6

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v8, v0, :cond_2

    .line 166
    const-string v21, "%02x"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aget-byte v24, v6, v8

    move/from16 v0, v24

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 145
    .end local v4    # "cipher":Ljavax/crypto/Cipher;
    .end local v6    # "encrypted":[B
    .end local v7    # "hexString":Ljava/lang/StringBuilder;
    .end local v8    # "i":I
    :catch_2
    move-exception v5

    .line 146
    .local v5, "e":Ljava/security/InvalidKeyException;
    const-string v21, "UIDevice"

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 147
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 148
    .end local v5    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v5

    .line 149
    .local v5, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v21, "UIDevice"

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 150
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 151
    .end local v5    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_4
    move-exception v5

    .line 152
    .local v5, "e":Ljavax/crypto/NoSuchPaddingException;
    const-string v21, "UIDevice"

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 153
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 154
    .end local v5    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_5
    move-exception v5

    .line 155
    .local v5, "e":Ljavax/crypto/IllegalBlockSizeException;
    const-string v21, "UIDevice"

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 156
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 157
    .end local v5    # "e":Ljavax/crypto/IllegalBlockSizeException;
    :catch_6
    move-exception v5

    .line 158
    .local v5, "e":Ljavax/crypto/BadPaddingException;
    const-string v21, "UIDevice"

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-static {v0, v1, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 159
    new-instance v21, Ljava/lang/IllegalStateException;

    const-string v22, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 168
    .end local v5    # "e":Ljavax/crypto/BadPaddingException;
    .restart local v4    # "cipher":Ljavax/crypto/Cipher;
    .restart local v6    # "encrypted":[B
    .restart local v7    # "hexString":Ljava/lang/StringBuilder;
    .restart local v8    # "i":I
    :cond_2
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    .line 170
    .end local v7    # "hexString":Ljava/lang/StringBuilder;
    .end local v8    # "i":I
    :goto_3
    return-object v21

    :cond_3
    const/16 v21, 0x0

    goto :goto_3

    .end local v4    # "cipher":Ljavax/crypto/Cipher;
    .end local v6    # "encrypted":[B
    .end local v17    # "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :cond_4
    move v13, v14

    .end local v14    # "saltIndex":I
    .restart local v13    # "saltIndex":I
    goto/16 :goto_1

    .line 129
    :array_0
    .array-data 1
        0x2dt
        0x37t
        -0x5et
        -0x33t
        0x28t
        -0x2at
        0x63t
        0x69t
        -0x14t
        0x5bt
        -0x4ft
        -0x17t
        -0x52t
        0x1ct
        0xat
        0x5et
        0xct
        -0x40t
        -0xdt
        0x5dt
    .end array-data
.end method

.method private getWifiMacAddress()Ljava/lang/String;
    .locals 5

    .prologue
    .line 68
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 69
    .local v0, "activity":Landroid/content/Context;
    const-string v4, "wifi"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/wifi/WifiManager;

    .line 71
    .local v3, "wifiMan":Landroid/net/wifi/WifiManager;
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 72
    .local v2, "wifiInf":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v1

    .line 73
    .local v1, "macAddress":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 74
    const-string v1, "000000000000000"

    .line 76
    .end local v1    # "macAddress":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method private initReachability()V
    .locals 4

    .prologue
    .line 192
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 193
    .local v0, "activity":Landroid/content/Context;
    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    iput-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 194
    new-instance v1, Lcom/disneymobile/mocha/support/UIDevice$ConnectivityBroadcastReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/disneymobile/mocha/support/UIDevice$ConnectivityBroadcastReceiver;-><init>(Lcom/disneymobile/mocha/support/UIDevice;Lcom/disneymobile/mocha/support/UIDevice$1;)V

    sput-object v1, Lcom/disneymobile/mocha/support/UIDevice;->receiver:Landroid/content/BroadcastReceiver;

    .line 195
    sget-object v1, Lcom/disneymobile/mocha/support/UIDevice;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 196
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/UIDevice;->internetConnectionStatus()Lcom/disneymobile/network/DMONetworkStatus;

    move-result-object v1

    iput-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->previousNetworkStatus:Lcom/disneymobile/network/DMONetworkStatus;

    .line 197
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/disneymobile/mocha/support/UIDevice;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/disneymobile/mocha/support/UIDevice;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/support/UIDevice;

    return-object v0
.end method

.method public static values()[Lcom/disneymobile/mocha/support/UIDevice;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/disneymobile/mocha/support/UIDevice;->$VALUES:[Lcom/disneymobile/mocha/support/UIDevice;

    invoke-virtual {v0}, [Lcom/disneymobile/mocha/support/UIDevice;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/disneymobile/mocha/support/UIDevice;

    return-object v0
.end method


# virtual methods
.method public cleanUp(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 186
    sget-object v0, Lcom/disneymobile/mocha/support/UIDevice;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 187
    sget-object v0, Lcom/disneymobile/mocha/support/UIDevice;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 189
    :cond_0
    return-void
.end method

.method public getMacHash()Ljava/lang/String;
    .locals 2

    .prologue
    .line 93
    iget-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->macHash:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 94
    invoke-direct {p0}, Lcom/disneymobile/mocha/support/UIDevice;->getWifiMacAddress()Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "uniqueID":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/disneymobile/mocha/support/UIDevice;->encryptString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->macHash:Ljava/lang/String;

    .line 97
    .end local v0    # "uniqueID":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->macHash:Ljava/lang/String;

    return-object v1
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public getSystemVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    return-object v0
.end method

.method public getUidInfo()Ljava/lang/String;
    .locals 2

    .prologue
    .line 84
    iget-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->encryptedID:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 85
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/UIDevice;->getUniqueIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "uniqueID":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/disneymobile/mocha/support/UIDevice;->encryptString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->encryptedID:Ljava/lang/String;

    .line 88
    .end local v0    # "uniqueID":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/support/UIDevice;->encryptedID:Ljava/lang/String;

    return-object v1
.end method

.method public getUniqueIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    const-string v0, ""

    return-object v0
.end method

.method public init()V
    .locals 0

    .prologue
    .line 182
    invoke-direct {p0}, Lcom/disneymobile/mocha/support/UIDevice;->initReachability()V

    .line 183
    return-void
.end method

    .method public internetConnectionStatus()Lcom/disneymobile/network/DMONetworkStatus;
    .locals 1

    sget-object v0, Lcom/disneymobile/network/DMONetworkStatus;->ViaWifi:Lcom/disneymobile/network/DMONetworkStatus;

    return-object v0
.end method

.method public internetConnectionStatusForURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/network/DMONetworkStatus;
    .locals 1
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/UIDevice;->internetConnectionStatus()Lcom/disneymobile/network/DMONetworkStatus;

    move-result-object v0

    return-object v0
.end method

.method public isFirstGeneration()Z
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x0

    return v0
.end method

.method public machineIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    return-object v0
.end method
