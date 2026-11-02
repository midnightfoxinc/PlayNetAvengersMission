.class public interface abstract Lcom/disney/id/android/constants/DIDTokenConst;
.super Ljava/lang/Object;
.source "DIDTokenConst.java"


# static fields
.field public static final ACCESS_TOKEN_KEY:Ljava/lang/String; = "access_token"

.field public static final AUTHENTICATOR_KEY:Ljava/lang/String; = "authenticator"

.field public static final BLUE_COOKIE_KEY:Ljava/lang/String; = "blue_cookie"

.field public static final CREATED_KEY:Ljava/lang/String; = "created"

.field public static final EXPIRES_KEY:Ljava/lang/String; = "expires"

.field public static final HIGH_TRUST_KEY:Ljava/lang/String; = "high_trust"

.field public static final HIGH_TRUST_WINDOW_IN_SECONDS:J

.field public static final REFRESH_TOKEN_EXPIRES_KEY:Ljava/lang/String; = "refresh_expires"

.field public static final REFRESH_TOKEN_KEY:Ljava/lang/String; = "refresh_token"

.field public static final REFRESH_TTL_KEY:Ljava/lang/String; = "refresh_ttl"

.field public static final SCOPE_KEY:Ljava/lang/String; = "scope"

.field public static final SSO_KEY:Ljava/lang/String; = "sso"

.field public static final SWID_KEY:Ljava/lang/String; = "swid"

.field public static final TOKEN_KEY:Ljava/lang/String; = "token"

.field public static final TTL_KEY:Ljava/lang/String; = "ttl"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 9
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1e

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/disney/id/android/constants/DIDTokenConst;->HIGH_TRUST_WINDOW_IN_SECONDS:J

    return-void
.end method
