.class synthetic Lcom/disneymobile/mocha/support/StringUtil$1;
.super Ljava/lang/Object;
.source "StringUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/support/StringUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$disneymobile$mocha$NSStringEncoding:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 84
    invoke-static {}, Lcom/disneymobile/mocha/NSStringEncoding;->values()[Lcom/disneymobile/mocha/NSStringEncoding;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/disneymobile/mocha/support/StringUtil$1;->$SwitchMap$com$disneymobile$mocha$NSStringEncoding:[I

    :try_start_0
    sget-object v0, Lcom/disneymobile/mocha/support/StringUtil$1;->$SwitchMap$com$disneymobile$mocha$NSStringEncoding:[I

    sget-object v1, Lcom/disneymobile/mocha/NSStringEncoding;->UTF8:Lcom/disneymobile/mocha/NSStringEncoding;

    invoke-virtual {v1}, Lcom/disneymobile/mocha/NSStringEncoding;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
