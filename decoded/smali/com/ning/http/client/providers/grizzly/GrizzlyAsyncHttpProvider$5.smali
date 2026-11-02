.class synthetic Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$ning$http$client$Realm$AuthScheme:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 860
    invoke-static {}, Lcom/ning/http/client/Realm$AuthScheme;->values()[Lcom/ning/http/client/Realm$AuthScheme;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    :try_start_0
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->DIGEST:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;->$SwitchMap$com$ning$http$client$Realm$AuthScheme:[I

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->NTLM:Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v1}, Lcom/ning/http/client/Realm$AuthScheme;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method
