.class public Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;
.super Ljava/util/ArrayList;
.source "IpFilterRuleList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lorg/jboss/netty/handler/ipfilter/IpFilterRule;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final serialVersionUID:J = -0x558b8189509c732cL


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-class v0, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "rules"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->parseRules(Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method private parseRule(Ljava/lang/String;)V
    .locals 5
    .param p1, "rule"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 69
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 72
    :cond_1
    const-string v2, "+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "-"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 73
    sget-object v2, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isErrorEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 74
    sget-object v2, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "syntax error in ip filter rule:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 79
    :cond_2
    const-string v2, "+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    .line 80
    .local v0, "allow":Z
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x6e

    if-eq v2, v3, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x69

    if-ne v2, v3, :cond_4

    .line 81
    :cond_3
    new-instance v2, Lorg/jboss/netty/handler/ipfilter/PatternRule;

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/jboss/netty/handler/ipfilter/PatternRule;-><init>(ZLjava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 82
    :cond_4
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x63

    if-ne v2, v3, :cond_5

    .line 84
    :try_start_0
    new-instance v2, Lorg/jboss/netty/handler/ipfilter/IpSubnetFilterRule;

    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/jboss/netty/handler/ipfilter/IpSubnetFilterRule;-><init>(ZLjava/lang/String;)V

    invoke-virtual {p0, v2}, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 85
    :catch_0
    move-exception v1

    .line 86
    .local v1, "e":Ljava/net/UnknownHostException;
    sget-object v2, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isErrorEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 87
    sget-object v2, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error parsing ip filter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Lorg/jboss/netty/logging/InternalLogger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 91
    .end local v1    # "e":Ljava/net/UnknownHostException;
    :cond_5
    sget-object v2, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isErrorEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 92
    sget-object v2, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "syntax error in ip filter rule:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->error(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private parseRules(Ljava/lang/String;)V
    .locals 6
    .param p1, "rules"    # Ljava/lang/String;

    .prologue
    .line 62
    const/16 v5, 0x2c

    invoke-static {p1, v5}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "ruless":[Ljava/lang/String;
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 64
    .local v3, "rule":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/jboss/netty/handler/ipfilter/IpFilterRuleList;->parseRule(Ljava/lang/String;)V

    .line 63
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v3    # "rule":Ljava/lang/String;
    :cond_0
    return-void
.end method
