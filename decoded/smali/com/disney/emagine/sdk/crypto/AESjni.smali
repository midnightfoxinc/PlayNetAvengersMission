.class public Lcom/disney/emagine/sdk/crypto/AESjni;
.super Ljava/lang/Object;
.source "AESjni.java"


# static fields
.field private static instance:Lcom/disney/emagine/sdk/crypto/AESjni;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const-string v0, "AESjni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/crypto/AESjni;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/disney/emagine/sdk/crypto/AESjni;->instance:Lcom/disney/emagine/sdk/crypto/AESjni;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/disney/emagine/sdk/crypto/AESjni;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/crypto/AESjni;-><init>()V

    sput-object v0, Lcom/disney/emagine/sdk/crypto/AESjni;->instance:Lcom/disney/emagine/sdk/crypto/AESjni;

    .line 31
    :cond_0
    sget-object v0, Lcom/disney/emagine/sdk/crypto/AESjni;->instance:Lcom/disney/emagine/sdk/crypto/AESjni;

    return-object v0
.end method


# virtual methods
.method public native aesCBCDecrypt([BI[B[B)[B
.end method

.method public native aesCBCEncrypt([BI[B[B)[B
.end method

.method public native aesCCMDecrypt([BI[B[B)[B
.end method

.method public native aesCCMEncrypt([BI[B[B)[B
.end method

.method public native getFactoryKey()[B
.end method

.method public native getProxyKey()Ljava/lang/String;
.end method

.method public native getRTOHost()Ljava/lang/String;
.end method
