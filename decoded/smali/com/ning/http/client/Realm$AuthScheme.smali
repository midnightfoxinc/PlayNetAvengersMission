.class public final enum Lcom/ning/http/client/Realm$AuthScheme;
.super Ljava/lang/Enum;
.source "Realm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/Realm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AuthScheme"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/ning/http/client/Realm$AuthScheme;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ning/http/client/Realm$AuthScheme;

.field public static final enum BASIC:Lcom/ning/http/client/Realm$AuthScheme;

.field public static final enum DIGEST:Lcom/ning/http/client/Realm$AuthScheme;

.field public static final enum KERBEROS:Lcom/ning/http/client/Realm$AuthScheme;

.field public static final enum NONE:Lcom/ning/http/client/Realm$AuthScheme;

.field public static final enum NTLM:Lcom/ning/http/client/Realm$AuthScheme;

.field public static final enum SPNEGO:Lcom/ning/http/client/Realm$AuthScheme;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 61
    new-instance v0, Lcom/ning/http/client/Realm$AuthScheme;

    const-string v1, "DIGEST"

    invoke-direct {v0, v1, v3}, Lcom/ning/http/client/Realm$AuthScheme;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->DIGEST:Lcom/ning/http/client/Realm$AuthScheme;

    .line 62
    new-instance v0, Lcom/ning/http/client/Realm$AuthScheme;

    const-string v1, "BASIC"

    invoke-direct {v0, v1, v4}, Lcom/ning/http/client/Realm$AuthScheme;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    .line 63
    new-instance v0, Lcom/ning/http/client/Realm$AuthScheme;

    const-string v1, "NTLM"

    invoke-direct {v0, v1, v5}, Lcom/ning/http/client/Realm$AuthScheme;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->NTLM:Lcom/ning/http/client/Realm$AuthScheme;

    .line 64
    new-instance v0, Lcom/ning/http/client/Realm$AuthScheme;

    const-string v1, "SPNEGO"

    invoke-direct {v0, v1, v6}, Lcom/ning/http/client/Realm$AuthScheme;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->SPNEGO:Lcom/ning/http/client/Realm$AuthScheme;

    .line 65
    new-instance v0, Lcom/ning/http/client/Realm$AuthScheme;

    const-string v1, "KERBEROS"

    invoke-direct {v0, v1, v7}, Lcom/ning/http/client/Realm$AuthScheme;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->KERBEROS:Lcom/ning/http/client/Realm$AuthScheme;

    .line 66
    new-instance v0, Lcom/ning/http/client/Realm$AuthScheme;

    const-string v1, "NONE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/Realm$AuthScheme;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->NONE:Lcom/ning/http/client/Realm$AuthScheme;

    .line 60
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/ning/http/client/Realm$AuthScheme;

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->DIGEST:Lcom/ning/http/client/Realm$AuthScheme;

    aput-object v1, v0, v3

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->BASIC:Lcom/ning/http/client/Realm$AuthScheme;

    aput-object v1, v0, v4

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->NTLM:Lcom/ning/http/client/Realm$AuthScheme;

    aput-object v1, v0, v5

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->SPNEGO:Lcom/ning/http/client/Realm$AuthScheme;

    aput-object v1, v0, v6

    sget-object v1, Lcom/ning/http/client/Realm$AuthScheme;->KERBEROS:Lcom/ning/http/client/Realm$AuthScheme;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/ning/http/client/Realm$AuthScheme;->NONE:Lcom/ning/http/client/Realm$AuthScheme;

    aput-object v2, v0, v1

    sput-object v0, Lcom/ning/http/client/Realm$AuthScheme;->$VALUES:[Lcom/ning/http/client/Realm$AuthScheme;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ning/http/client/Realm$AuthScheme;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    const-class v0, Lcom/ning/http/client/Realm$AuthScheme;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/Realm$AuthScheme;

    return-object v0
.end method

.method public static values()[Lcom/ning/http/client/Realm$AuthScheme;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/ning/http/client/Realm$AuthScheme;->$VALUES:[Lcom/ning/http/client/Realm$AuthScheme;

    invoke-virtual {v0}, [Lcom/ning/http/client/Realm$AuthScheme;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ning/http/client/Realm$AuthScheme;

    return-object v0
.end method
